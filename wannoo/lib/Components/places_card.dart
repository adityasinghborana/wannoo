import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../constants.dart';

class PlacesCards extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final double rating;
  final double price;

  const PlacesCards(
      {super.key,
      required this.title,
      required this.image,
      required this.location,
      this.rating = 4.7,
      this.price = 250});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalRadius.borderRadius_s),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 6,
              blurRadius: 10)
        ],
        color: ThemeColor
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
                                Radius.circular(GlobalRadius.borderRadius_s),
                            bottomLeft:
                                Radius.circular(GlobalRadius.borderRadius_s)),
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
                  horizontal: 8.0, vertical: GlobalPadding.px_md),
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
                        color: ThemeColor.colorTextSecondry,
                        size: 15,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        color: ThemeColor.colorBgSecondory,
                        size: 15,
                      ),
                      const Gap(10),
                      Text(
                        location,
                        style: const TextStyle(
                          color: ThemeColor.colorTextPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.star,
                            color: ThemeColor.colorBgSecondory,
                            size: 15,
                          ),
                          const Gap(10),
                          Text(
                            "$rating",
                            style: const TextStyle(
                              color: ThemeColor.colorTextPrimary,
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
