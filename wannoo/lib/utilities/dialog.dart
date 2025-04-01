import 'dart:math';
import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/itinarary/data_layer/model/request/favtourrequest.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/itinarary/data_layer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/data_layer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/data_layer/service/itinarary_remote.dart';
import 'package:wannoo/utilities/auth_class.dart';
import '../homepage/presentation_layer/homepage_controller.dart';
import '../itinarary/data_layer/repository/itinarary_repository.dart';
import '../itinarary/data_layer/service/itinarary_remote.dart';

Future<void> showMyDialog(BuildContext context, List<String> items) async {
  // A list to keep track of checkbox states
  List<bool> checkedStates = List<bool>.filled(items.length, false);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Add To Itinerary'),
            content: SingleChildScrollView(
              child: ListBody(
                children: List<Widget>.generate(items.length, (index) {
                  return CheckboxListTile(
                    title: Text(items[index]),
                    value: checkedStates[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkedStates[index] = value ?? false;
                      });
                    },
                  );
                }),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Process checkedStates if needed
                },
              ),
            ],
          );
        },
      );
    },
  );
}

enum StateType { error, success, info }

void showSnackBar(BuildContext context, String text,
    {required StateType state}) {
  Color bgColor;

  switch (state) {
    case StateType.error:
      bgColor = ThemeColor.colorAccentSecondory;
      break;
    case StateType.success:
      bgColor = ThemeColor.success;
      break;
    case StateType.info:
      bgColor = ThemeColor.colorBgSecondory;
      break;
  }
  // If message contains "firebase_auth/" or "firebase/", remove it, else keep the original message
  final modifiedMessage = text.contains(RegExp(r'firebase(_auth)?/'))
      ? text.replaceAll(RegExp(r'firebase(_auth)?/'), '')
      : text;
  return simpleToastMessage(
      text: modifiedMessage,
      textColour: ThemeColor.colorWhite,
      color: bgColor,
      context: context);
}

Future<void> showMyModalBottomSheet(
  BuildContext context,
  int selectedTourId,
) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Ensures the bottom sheet can expand
    builder: (BuildContext context) {
      final homePageController = Get.find<HomePageController>();
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              min((homePageController.itinararyList.length * 56) + 88, 480),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const SizedBox(height: 8),
            Text(
              'Add To Itinerary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // Wrap ListView.builder inside an Expanded to allow scrolling
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: homePageController.itinararyList.length,
                itemBuilder: (context, index) {
                  var item = homePageController.itinararyList[index];
                  return ItineraryListTile(
                    itineraryId: item.id ?? 0,
                    tourId: selectedTourId,
                    title: Text("${item.name}"),
                    onTap: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

class ItineraryListTile extends StatefulWidget {
  final VoidCallback? onTap;
  final int itineraryId;
  final int tourId;
  final Widget? title;

  const ItineraryListTile({
    super.key,
    required this.itineraryId,
    required this.tourId,
    this.title,
    this.onTap,
  });

  @override
  State<ItineraryListTile> createState() => ItineraryListTileState();
}

class ItineraryListTileState extends State<ItineraryListTile> {
  final _repo = ItinararyRepoImpl(ItinararyRemote(Dio()));
  int? _favTourId;
  var _selected = false;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _repo.getFavTours(FavTourRequest(id: widget.itineraryId)).then((value) {
      setState(() {
        final selected = value.firstWhereOrNull((t) => t.id == widget.tourId);
        if (selected != null) {
          _favTourId = selected.tourId;
          _selected = true;
        }

        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return ListTile(
      title: widget.title,
      trailing: AnimatedOpacity(
        duration: Durations.short3,
        opacity: _loading ? 0.2 : 1.0,
        child: AnimatedCrossFade(
          firstChild: const FaIcon(FontAwesomeIcons.solidHeart),
          secondChild: const FaIcon(FontAwesomeIcons.heart),
          crossFadeState:
              _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Durations.short3,
        ),
      ),
      onTap: _loading
          ? null
          : () async {
              setState(() => _selected = !_selected);
              if (_selected) {
                var user = await getUserUID();
                controller.postFavTours(
                    data: PostFavTourRequest(
                  itineraryId: widget.itineraryId,
                  tourId: widget.tourId,
                  userId: user!,
                ));
              } else {
                await controller.deleteFavTour(
                  itineraryId: widget.itineraryId,
                  tourId: _favTourId!,
                );
              }
              widget.onTap?.call();
            },
    );
  }
}
