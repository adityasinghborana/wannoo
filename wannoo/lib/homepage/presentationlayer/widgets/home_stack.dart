import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/custom_icon.dart';

import '../../../Components/Textfield.dart';
import '../../../Constants.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =  TextEditingController();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color:
                            themeColor.colorBorder.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(
                                globalRadius.borderRadius_s)),
                        child: Icon(
                          Icons.menu_rounded,
                          color: themeColor.colorTextPrimary,
                        )),
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
                      child: CircleAvatar(
                        backgroundColor: themeColor.colorBgSecondory,
                        foregroundImage: AssetImage(image.person),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: Get.width,
                    child: TextFieldCustom(textController: searchController, hintText: "search places",fillColor: themeColor.colorWhite,prefixIcon: Icons.search,

                    ),
                  ),
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
