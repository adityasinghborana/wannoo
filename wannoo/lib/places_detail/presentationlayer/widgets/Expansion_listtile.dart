import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/styles.dart';

class DetailsExapansionTile extends StatelessWidget {
  final bool isExpanded;
  final String Title;
  final String Description;

  DetailsExapansionTile({
    required this.isExpanded,
    required this.Title,
    required this.Description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: globalPadding.px_md),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: themeColor.colorBorder,
              // Change the color to your desired color
              width: 1.0, // Adjust the width of the border as needed
            ),
            // bottom: BorderSide(
            //   color: themeColor.colorBorder, // Change the color to your desired color
            //   width: 1.0, // Adjust the width of the border as needed
            // ),
          ),
        ),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none, // Remove the border
          ),
          // Define the shape with borders for top and bottom only
          tilePadding: EdgeInsets.zero,
          // Remove default padding
          childrenPadding:
              EdgeInsets.symmetric(horizontal: globalPadding.px_sm),
          title: Text(
            Title,
            textAlign: TextAlign.left,
            style: TypographyStyle.l2Font,
          ),
          children: [
            Container(
              alignment: Alignment.centerLeft, // Align children to the left
              padding: EdgeInsets.all(8.0), // Optional: add some padding
              child: Wrap(
                spacing: 2.0,
                runSpacing: 2.0,
                children: [
                  Text(Description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
