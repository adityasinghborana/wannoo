import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';

import '../utilities/dialog.dart';

class ExperiencesCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final bool isfav;
  final bool isAddIcon;
  final int selectedTourId;
  final bool isPriceVisible;
  final double? price;

  const ExperiencesCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      this.isAddIcon = true,
      required this.selectedTourId,
      required this.location,
      this.price,
      this.isPriceVisible = true,
      required this.isfav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: globalPadding.px_xs),
      child: Container(
        width: Get.width / 1.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(globalRadius.borderRadius_m),
          child: Stack(
            children: [
              Image.asset(
                image.experiencesimages,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    image.experiencesimages,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ); // Replace with a local default image
                },
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(globalPadding.px_xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isAddIcon)
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  themeColor.colorTextSecondry.withOpacity(0.4),
                            ),
                            child: InkWell(
                                onTap: () {
                                  showMyModalBottomSheet(
                                      context, selectedTourId);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: themeColor.colorBgSecondory,
                                ))),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  color: themeColor.colorTextPrimary.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: globalPadding.px_sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: themeColor.colorBgPrimary,
                                        size: 15,
                                      ),
                                      Text(
                                        location,
                                        style: TextStyle(
                                          color: themeColor.colorWhite,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Flexible(
                                      child: isPriceVisible
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.dollarSign,
                                                  color:
                                                      themeColor.colorBgPrimary,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "$price",
                                                  style: TextStyle(
                                                    color:
                                                        themeColor.colorWhite,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
