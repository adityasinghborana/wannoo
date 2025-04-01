import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/styles.dart';

class MainDetails extends StatelessWidget {
  final String tourname;
  final String Country;
  final double rating;
  final int reviews;
  final double price;

  const MainDetails(
      {required this.tourname,
      required this.Country,
      required this.rating,
      required this.reviews,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: globalPadding.px_md, vertical: globalPadding.py_md),
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
                      Container(
                        child: Text(
                          tourname,
                          style: TypographyStyle.xlFont,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        color: themeColor.colorTextSecondry,
                      ),
                      const Gap(10),
                      Text(Country,
                          style: TypographyStyle.mdFont.copyWith(
                            color: themeColor.colorTextSecondry,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        color: themeColor.colorBgSecondory,
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
