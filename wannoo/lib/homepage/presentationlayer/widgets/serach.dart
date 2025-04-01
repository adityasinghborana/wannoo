import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.search);
      },
      child: Container(
        padding: const EdgeInsets.all(globalPadding.px_sm),
        decoration: BoxDecoration(
            color: themeColor.colorBgPrimary,
            borderRadius: BorderRadius.circular(globalRadius.borderRadius_m)),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 5,
            ),
            Text("Serach Places ")
          ],
        ),
      ),
    );
  }
}
