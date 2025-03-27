import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/routes.dart';

import '../../Components/largeButton2.dart';
import '../../Constants.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(globalPadding.px_xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image.paymentsucess),
            const Gap(Height.heightxl),
            Text(
              'Payment Success',
              style: CustomTextStyles.fontXxlSemiBold,
            ),
            const Gap(Height.heightMd),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
              style: CustomTextStyles.fontMdMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(Height.heightMd),
            LargeButton2(
                label: "Go Home",
                height: Height.heightButtonXLarge,
                onPressed: () {
                  Get.toNamed(AppRoutes.home);
                })
          ],
        ),
      ),
    );
  }
}
