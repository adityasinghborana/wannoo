import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/custom_icon.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/serach.dart';
import 'package:wannoo/routes.dart';

import '../../../Components/Textfield.dart';
import '../../../Constants.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.find();

    final TextEditingController searchController = TextEditingController();
    return Container(
      width: double.infinity,
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image.homeimage, // Ensure this points to your asset correctly
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //     height: 50,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //         color:
                    //         themeColor.colorBorder.withOpacity(0.7),
                    //         borderRadius: BorderRadius.circular(
                    //             globalRadius.borderRadius_s)),
                    //     child: Icon(
                    //       Icons.menu_rounded,
                    //       color: themeColor.colorTextPrimary,
                    //     )),
                    Container(
                      padding: EdgeInsets.all(2.0), // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: themeColor.colorBgSecondory, // Border color
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: themeColor.colorBgSecondory, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.profile);
                        },
                        child: Obx(() {
                          return CircleAvatar(
                            backgroundColor: Colors.grey, // Customize as needed
                            foregroundImage: homePageController
                                        .currentImage.value !=
                                    null
                                ? NetworkImage(
                                    "$baseurl/${homePageController.currentImage.value!}") // Show FileImage if available
                                : AssetImage(image.person)
                                    as ImageProvider, // Default asset image
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      height: 50, width: Get.width, child: SearchWidget()),
                ],
              ),
            ],
          ),
          // Add more widgets inside the Stack if needed
        ],
      ),
    );
  }
}
