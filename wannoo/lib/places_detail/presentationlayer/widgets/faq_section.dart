import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/places_detail/datalayer/model/placedetails.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_controller.dart';

import '../../../Constants.dart';
import '../../../styles.dart';
import 'Faq.dart';

class FaqSection extends StatelessWidget {
  final List<Faq> list;
  const FaqSection(this.list, {super.key});
  @override
  Widget build(BuildContext context) {
    final PlacedetailsController placedetailsController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: globalPadding.px_md, vertical: 15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FAQ",
              style: TypographyStyle.l2Font,
            ),
            ListView.builder(
              shrinkWrap: true,
              // Ensure that the ListView takes only the space it needs
              physics: const NeverScrollableScrollPhysics(),
              // Disable scrolling of the ListView
              itemCount: list.length,
              itemBuilder: (context, index) {
                return FaqExapansionTile(
                  isExpanded: true,
                  Title: list[index].question,
                  Description: list[index].answer,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
