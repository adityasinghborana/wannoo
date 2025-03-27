import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Categoryplaces/presentationlayer/categoryplacesscreen.dart';
import 'package:wannoo/Components/largeButton2.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/utilities/Authclass.dart';
import 'package:wannoo/utilities/extension.dart';

import '../homepage/presentationlayer/homepage_controller.dart';

enum StateType { Error, Success, Info }

void showToast({required StateType state, required String message}) {
  Color bgColor;

  switch (state) {
    case StateType.Error:
      bgColor = themeColor.colorAccentSecondory;
      break;
    case StateType.Success:
      bgColor = themeColor.success;
      break;
    case StateType.Info:
      bgColor = themeColor.colorBgSecondory;
      break;
  }
  // If message contains "firebase_auth/" or "firebase/", remove it, else keep the original message
  final modifiedMessage = message.contains(RegExp(r'firebase(_auth)?/'))
      ? message.replaceAll(RegExp(r'firebase(_auth)?/'), '')
      : message;
  return simpleToastMessage(
      text: modifiedMessage,
      textColour: themeColor.colorWhite,
      color: bgColor,
      context: Get.context!);
}

Future<void> showMyModalBottomSheet(
    BuildContext context, int selectedTourId) async {
  print(selectedTourId);

  await showModalBottomSheet(
    backgroundColor: themeColor.colorscafold,
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
                        return Container(
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
                                      var User = await getUserUID();

                                      homePageController.postFavTours(
                                          context: context,
                                          data: PostFavTourRequest(
                                              itineraryId: items[index].id ?? 0,
                                              tourId: selectedTourId,
                                              userId: User ?? ""));
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
