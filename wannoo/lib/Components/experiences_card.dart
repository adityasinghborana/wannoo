import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: GlobalPadding.px_xs),
      child: SizedBox(
        width: Get.width / 1.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(GlobalRadius.borderRadius_m),
          child: Stack(
            children: [
              Image.network(
                imagePath,
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
                  padding: const EdgeInsets.all(GlobalPadding.px_xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isAddIcon)
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeColor.colorTextSecondry
                                  .withValues(alpha: 0.4),
                            ),
                            child: InkWell(
                                onTap: () {
                                  showMyModalBottomSheet(
                                      context, selectedTourId);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: ThemeColor.colorBgSecondory,
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
                  color: ThemeColor.colorTextPrimary.withValues(alpha: 0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: GlobalPadding.px_sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: ThemeColor.colorBgPrimary,
                                        size: 15,
                                      ),
                                      Text(
                                        location,
                                        style: const TextStyle(
                                          color: ThemeColor.colorWhite,
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
                                                const Icon(
                                                  FontAwesomeIcons.dollarSign,
                                                  color:
                                                      ThemeColor.colorBgPrimary,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "$price",
                                                  style: const TextStyle(
                                                    color:
                                                        ThemeColor.colorWhite,
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
