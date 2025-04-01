import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class PlacesCards extends StatelessWidget {
  final String title;

  final String image;

  final String Location;

  final double rating;

  final double price;

  const PlacesCards(
      {super.key,
      required this.title,
      required this.image,
      required this.Location,
      this.rating = 4.7,
      this.price = 250});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(globalRadius.borderRadius_s),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 6,
              blurRadius: 10)
        ],
        color: themeColor
            .colorBgPrimary, // Optional: background color for visibility
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(globalRadius.borderRadius_s),
                            bottomLeft:
                                Radius.circular(globalRadius.borderRadius_s)),
                        child: Image.network(
                          image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: globalPadding.px_md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.fontMdMedium,
                      ),
                      const Icon(
                        FontAwesomeIcons.bookmark,
                        color: themeColor.colorTextSecondry,
                        size: 15,
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationDot,
                          color: themeColor.colorBgSecondory,
                          size: 15,
                        ),
                        const Gap(10),
                        Text(
                          Location,
                          style: const TextStyle(
                            color: themeColor.colorTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.star,
                            color: themeColor.colorBgSecondory,
                            size: 15,
                          ),
                          const Gap(10),
                          Text(
                            "$rating",
                            style: const TextStyle(
                              color: themeColor.colorTextPrimary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Price"),
                          const Gap(10),
                          Text("\$ $price")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
