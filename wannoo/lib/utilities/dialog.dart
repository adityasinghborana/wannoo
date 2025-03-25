import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button_2.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/utilities/auth_class.dart';

import '../homepage/presentationlayer/homepage_controller.dart';

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

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<void> showMyModalBottomSheet(
    BuildContext context, int selectedTourId) async {
  print(selectedTourId);

  await showModalBottomSheet(
    backgroundColor: ThemeColor.colorscafold,
    context: context,
    isScrollControlled: true, // Ensures the bottom sheet can expand
    builder: (BuildContext context) {
      final HomePageController homePageController = Get.find();
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: Get.height * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add To Itinerary',
                    style: CustomTextStyles.fontXlSemiBold,
                  ),
                  const SizedBox(height: 16),
                  // Wrap ListView.builder inside an Expanded to allow scrolling
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homePageController.itinararyList.length,
                      itemBuilder: (context, index) {
                        var items = homePageController.itinararyList;
                        return SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${items[index].name}"),
                              SizedBox(
                                height: 30,
                                width: 100,
                                child: LargeButton2(
                                    label: "Add ",
                                    height: 90,
                                    onPressed: () async {
                                      var user = await getUserUID();
                                      homePageController.postFavTours(
                                          data: PostFavTourRequest(
                                              itineraryId: items[index].id ?? 0,
                                              tourId: selectedTourId,
                                              userId: user ?? ""));
                                    }),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
