import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:wannoo/components/large_button_2.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/bookings/presentation_layer/bookings_controller.dart';

import '../data_layer/repo/intent_repo.dart';
import '../data_layer/service/remote.dart';
import '../data_layer/usecase/intentusecase.dart';

class ExternalWebsite extends StatelessWidget {
  final BookingsController bookingsController = Get.put(BookingsController(
    intentUseCase: IntentUseCase(
      StripeIntentRepositoryImpl(
        StripeRemoteService(Dio()),
      ),
    ),
  ));
  ExternalWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GlobalPadding.px_md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notice',
              style: CustomTextStyles.fontL1SemiBold,
            ),
            const Gap(Height.heightSm),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
              style: CustomTextStyles.fontMdMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(Height.heightSm),
            LargeButton2(
                label: "Visit Website",
                height: Height.heightButtonXLarge,
                onPressed: () {
                  bookingsController.launchURL();
                })
          ],
        ),
      ),
    );
  }
}
