import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wannoo/routes.dart';

import '../../utilities/dialog.dart';
import '../datalayer/model/request/intent_request.dart';
import '../datalayer/usecase/intentusecase.dart';

class BookingsController extends GetxController {
  final IntentUseCase intentUseCase;

  BookingsController({
    required this.intentUseCase,
  });

  var price = Get.arguments["price"];
  RxInt noOfGuest = 0.obs;
  RxString date = "".obs;
  final TextEditingController nameController = TextEditingController();
  var paymentmethodid = ''.obs;
  RxString stripeclientkey = "".obs;
  final Uri url = Uri.parse("https://www.google.com"); // Replace with your URL

  void launchURL() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onClose() {
    nameController
        .clear(); // Clear the controller when the controller is closed
    super.onClose();
  }

  Future<void> initiateCheckout() async {
    if (nameController.text.isEmpty) {
      showSnackBar(Get.context!, "Enter the name of the Booking Person");
    } else if (noOfGuest.value == 0) {
      showSnackBar(Get.context!, "Select no of Guest Going on the Tour ");
    } else if (date.value == "") {
      showSnackBar(Get.context!, "Select Date ");
    } else {
      //bookingsController.initiateCheckout();

      try {
        // Step 1: Fetch the payment intent client secret
        final intent = await intentUseCase.execute(IntentRequest(
            name: nameController.text.toString(),
            email: 'aditya@ogresto.com',
            amount: price));
        if (intent != null && intent.clientSecret != null) {
          stripeclientkey.value = intent.clientSecret!;
          print("Client Secret: ${stripeclientkey.value}");
        } else {
          print("Error getting client secret");
          Get.toNamed('/paymentFailure');
          return;
        }

        // Step 2: Initialize the Payment Sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: stripeclientkey.value,
            merchantDisplayName: 'Wannoo',
          ),
        );

        ///TODO create Bookings and Get Bookings of the USER
        // Step 3: Present the Payment Sheet
        await Stripe.instance.presentPaymentSheet();

        // Step 4: Confirm payment success
        final paymentIntent =
            await Stripe.instance.retrievePaymentIntent(stripeclientkey.value);
        if (paymentIntent.status == PaymentIntentsStatus.Succeeded) {
          nameController.clear();
          print("Payment successful");
          Get.toNamed(AppRoutes.paymentSuccess);
        } else {
          nameController.clear();

          print("Payment not successful: ${paymentIntent.status}");
          Get.toNamed(AppRoutes.paymentFailure);
        }
      } catch (e) {
        nameController.clear();
        print("Error during payment: $e");
        Get.toNamed(AppRoutes.paymentFailure);
      }
    }
  }
}
