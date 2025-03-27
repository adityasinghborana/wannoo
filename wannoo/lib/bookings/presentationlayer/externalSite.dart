import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:wannoo/Components/largeButton2.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/bookings/presentationlayer/bookingscontroller.dart';

import '../datalayer/repo/intent_repo.dart';
import '../datalayer/service/remote.dart';
import '../datalayer/usecase/intentusecase.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: globalPadding.px_md),
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
