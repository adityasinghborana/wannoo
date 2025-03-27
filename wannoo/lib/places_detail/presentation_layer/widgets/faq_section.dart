import 'package:flutter/material.dart';
import 'package:wannoo/places_detail/data_layer/model/placedetails.dart';

import '../../../constants.dart';
import '../../../styles.dart';
import 'Faq.dart';

class FaqSection extends StatelessWidget {
  final List<Faq> list;
  const FaqSection(this.list, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalPadding.px_md, vertical: 15),
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
    );
  }
}
