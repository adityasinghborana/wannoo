import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/routes.dart';

import '../../components/large_button_2.dart';
import '../../constants.dart';

class PaymentFailure extends StatelessWidget {
  const PaymentFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(GlobalPadding.px_xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(StaticImage.paymentfailure),
            const Gap(Height.heightxl),
            Text(
              'Payment Failure',
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
