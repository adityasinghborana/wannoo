import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wannoo/routes.dart';

import '../../../constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.search);
      },
      child: Container(
        padding: const EdgeInsets.all(GlobalPadding.px_sm),
        decoration: BoxDecoration(
            color: ThemeColor.colorBgPrimary,
            borderRadius:
                BorderRadius.circular(GlobalRadius.borderRadiusMedium)),
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
