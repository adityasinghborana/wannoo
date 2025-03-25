import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/styles.dart';

class FaqExapansionTile extends StatelessWidget {
  final bool isExpanded;
  final String Title;
  final String Description;

  const FaqExapansionTile({
    super.key,
    required this.isExpanded,
    required this.Title,
    required this.Description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GlobalPadding.px_md),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ThemeColor
                  .colorBorder, // Change the color to your desired color
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
          tilePadding: EdgeInsets.zero, // Remove default padding
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: GlobalPadding.px_sm),
          trailing: const Icon(
            Icons.add, // Change the icon to your desired icon
            color: ThemeColor
                .colorTextSecondry, // Change the color of the icon if needed
          ),
          title: Text(
            Title,
            textAlign: TextAlign.left,
            style: TypographyStyle.mdFont,
          ),
          children: [
            Container(
              alignment: Alignment.centerLeft, // Align children to the left
              padding: const EdgeInsets.all(8.0), // Optional: add some padding
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
