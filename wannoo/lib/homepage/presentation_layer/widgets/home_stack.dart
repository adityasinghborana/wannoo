import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/homepage/presentation_layer/widgets/search.dart';
import 'package:wannoo/routes.dart';

import '../../../Constants.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.find();
    return SizedBox(
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
                    Container(
                      padding:
                          const EdgeInsets.all(2.0), // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: ThemeColor.colorBgSecondory, // Border color
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ThemeColor.colorBgSecondory, // Border color
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
                            foregroundImage: NetworkImage(
                                "$baseurl/${homePageController.currentImage.value}"), // Default asset image
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: Get.width,
                      child: const SearchWidget()),
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
