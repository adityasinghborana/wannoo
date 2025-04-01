import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/search/presentation_layer/widgets/drop_down.dart';

import '../../components/text_field.dart';
import '../../components/large_button_2.dart';
import '../data_layer/repo/intent_repo.dart';
import '../data_layer/service/remote.dart';
import '../data_layer/usecase/intentusecase.dart';
import 'bookings_controller.dart';

class BookingsScreen extends StatelessWidget {
  final BookingsController bookingsController = Get.put(BookingsController(
    intentUseCase: IntentUseCase(
      StripeIntentRepositoryImpl(
        StripeRemoteService(Dio()),
      ),
    ),
  ));
  BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<String> list = <String>["1 ", "2", "3", "4", "5", "6"].obs;

    return Scaffold(
      appBar: AppBar(title: const Text("Bookings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GlobalPadding.px_md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: ThemeColor.colorBgSecondory,
                  onPrimary: ThemeColor.colorWhite,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: ThemeColor.colorBgSecondory,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColor.colorWhite,
                  boxShadow: [globalShadow],
                  borderRadius:
                      BorderRadius.circular(GlobalRadius.borderRadius_m),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026, 12, 1),
                  onDateChanged: (value) {
                    bookingsController.date.value =
                        value.toString().substring(0, 10);
                    debugPrint(value.toString());
                  },
                ),
              ),
            ),
            const Gap(Height.heightxl),
            Text(
              "Name",
              style: CustomTextStyles.fontL2SemiBold,
            ),
            const Gap(Height.heightMd),
            Container(
              decoration: BoxDecoration(
                color: ThemeColor.colorWhite,
                boxShadow: [globalShadow],
                borderRadius:
                    BorderRadius.circular(GlobalRadius.borderRadius_m),
              ),
              child: TextFieldCustom(
                textController: bookingsController.nameController,
                hintText: 'John Doe',
              ),
            ),
            const Gap(Height.heightl),
            Text(
              "Guest People",
              style: CustomTextStyles.fontL2SemiBold,
            ),
            const Gap(Height.heightMd),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: GlobalPadding.px_sm,
                vertical: GlobalPadding.px_xs,
              ),
              decoration: BoxDecoration(
                color: ThemeColor.colorWhite,
                boxShadow: [globalShadow],
                borderRadius:
                    BorderRadius.circular(GlobalRadius.borderRadius_m),
              ),
              child: CustomDropDown(
                list: list,
                onChanged: (value) {
                  bookingsController.noOfGuest.value = int.parse(value);
                  debugPrint(value);
                },
              ),
            ),
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  var amount = (bookingsController.price *
                          bookingsController.noOfGuest.value)
                      .toStringAsFixed(2); // Round to 2 decimal places
                  return Text(
                    "Total Payable Amount \$$amount USD",
                    style: CustomTextStyles.fontL2SemiBold,
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            LargeButton2(
              label: "Proceed Checkout",
              onPressed: () {
                bookingsController.initiateCheckout();
              },
              height: Height.heightButtonXLarge,
            ),
          ],
        ),
      ),
    );
  }
}
