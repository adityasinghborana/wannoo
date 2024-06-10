import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  const CategoryCard({super.key,required this.imagePath,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: globalPadding.px_md,vertical: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(globalRadius.borderRadius_s),
        elevation: 8,
        child: Container(

          width: 75,



          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,children: [Image.asset(imagePath),Text(title)],),
        ),
      ),
    );
  }
}
