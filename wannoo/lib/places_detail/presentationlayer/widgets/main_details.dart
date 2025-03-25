import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/styles.dart';

class MainDetails extends StatelessWidget {
  final String tourname;
  final String country;
  final double rating;
  final int reviews;
  final double price;

  const MainDetails(
      {required this.tourname,
      required this.country,
      required this.rating,
      required this.reviews,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalPadding.px_md, vertical: GlobalPadding.py_md),
      child: SizedBox(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        tourname,
                        style: TypographyStyle.xlFont,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        color: ThemeColor.colorTextSecondry,
                      ),
                      const Gap(10),
                      Text(country,
                          style: TypographyStyle.mdFont.copyWith(
                            color: ThemeColor.colorTextSecondry,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        color: ThemeColor.colorBgSecondory,
                      ),
                      const Gap(10),
                      Text("$rating"),
                      const Gap(10),
                      Text("($reviews Reviews)")
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "\$ $price",
                    style: TypographyStyle.xxlFont
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
