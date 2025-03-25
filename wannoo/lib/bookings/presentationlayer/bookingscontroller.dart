import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wannoo/bookings/datalayer/model/request/booking_request.dart';
import 'package:wannoo/bookings/datalayer/repo/bookings_repo.dart';
import 'package:wannoo/bookings/datalayer/service/bookings_remote.dart';

import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/auth_class.dart';
import '../../utilities/dialog.dart';
import '../datalayer/model/request/intent_request.dart';
import '../datalayer/usecase/booking_request.dart';
import '../datalayer/usecase/intentusecase.dart';

class BookingsController extends GetxController {
  final IntentUseCase intentUseCase;
  CreateBookingUseCase bookingsUseCase =
      CreateBookingUseCase(BookingsRepoImpl(BookingsRemote(Dio())));

  BookingsController({
    required this.intentUseCase,
  });

  var price = Get.arguments["price"];
  var tourid = Get.arguments["tourid"];

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
            amount: price * noOfGuest.value));
        stripeclientkey.value = intent.clientSecret;
        debugPrint("Client Secret: ${stripeclientkey.value}");

        // Step 2: Initialize the Payment Sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: stripeclientkey.value,
            merchantDisplayName: 'Wannoo',
          ),
        );

        await Stripe.instance.presentPaymentSheet();

        // Step 4: Confirm payment success
        final paymentIntent =
            await Stripe.instance.retrievePaymentIntent(stripeclientkey.value);
        if (paymentIntent.status == PaymentIntentsStatus.Succeeded) {
          var uid = await getUserUID();
          var r = BookingRequest(
            fullName: nameController.text,
            email: "aditya@ogresto.com",
            status: 'Success',
            passengers: noOfGuest.value,
            tourDate: date.value,
            serviceTotal: price * noOfGuest.value,
            userId: uid ?? "",
            roleId: 'Vendor123',
            tourId: tourid,
          );

          nameController.clear();
          bookingsUseCase.execute(r).then((response) {
            debugPrint("Payment successful");
            Get.toNamed(AppRoutes.paymentSuccess);
          });
        } else {
          nameController.clear();

          debugPrint("Payment not successful: ${paymentIntent.status}");
          Get.toNamed(AppRoutes.paymentFailure);
        }
      } catch (e) {
        nameController.clear();
        debugPrint("Error during payment: $e");
        Get.toNamed(AppRoutes.paymentFailure);
      }
    }
  }
}
