import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';

import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/dialog.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../../Components/Textfield.dart';
import '../widgets/savedcards.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Gap(20),
            Text(
              "Your Itinarary List",
              style: CustomTextStyles.fontL2SemiBold,
            ),
            Expanded(child: Container()),
            InkWell(onTap: () => openDialog(), child: Icon(Icons.add_circle)),
            Gap(20)
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => ListView.builder(
                    itemCount: homePageController.itinararyList
                        .length, // Set the number of items you want
                    itemBuilder: (BuildContext context, int index) => Padding(
                          padding: EdgeInsets.all(2),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.savedList, parameters: {
                                "title": homePageController
                                        .itinararyList[index].name ??
                                    "",
                                "id": homePageController.itinararyList[index].id
                                    .toString(),
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: globalPadding.px_sm),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: themeColor.colorWhite,
                                  boxShadow: [globalShadow]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${homePageController.itinararyList[index].name}"),
                                      IconButton(
                                        color: Colors.red.shade700,
                                        onPressed: () {
                                          homePageController.deleteItinarary(
                                              homePageController
                                                      .itinararyList[index]
                                                      .id ??
                                                  0);
                                        },
                                        icon: Icon(Icons.delete),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openDialog() {
    final HomePageController homePageController = Get.find();
    return Get.dialog(Dialog(
      child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Enter Itinarary Name ",
                style: CustomTextStyles.fontL1SemiBold,
              ),
              TextFieldCustom(
                textController: homePageController.itinararyController,
                hintText: 'Vaccation trip ',
              ),
              LargeButton(
                  label: "Add Itinarary",
                  onPressed: () {
                    homePageController.postItinarary();
                    Get.back();
                  })
            ],
          )),
    ));
  }
}
