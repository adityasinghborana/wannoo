import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: GlobalPadding.px_md, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: ThemeColor.colorWhite,
            borderRadius: BorderRadius.circular(GlobalRadius.borderRadius_m),
            boxShadow: [
              globalShadow,
            ]),
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              '$baseurl/$imagePath' ,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Ensures it takes up available width
                  height:30, // Ensures it takes up available height
                  child: Image.asset(
                    image.Cat1,
                    fit: BoxFit.contain,
                  ),
                ); // Replace with a local default image
              },
            ),
            Center(
              child: Text(
                title,
                style: CustomTextStyles.fontSMedium,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
