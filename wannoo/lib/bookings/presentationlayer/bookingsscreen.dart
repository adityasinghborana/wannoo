import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/search/presentationlayer/widgets/DropDown.dart';
import 'package:wannoo/utilities/dialog.dart';

import '../../Components/Textfield.dart';
import '../../Components/largeButton2.dart';
import '../datalayer/repo/intent_repo.dart';
import '../datalayer/service/remote.dart';
import '../datalayer/usecase/intentusecase.dart';
import 'bookingscontroller.dart';

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
      appBar: AppBar(title: Text("Bookings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(globalPadding.px_md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: themeColor.colorBgSecondory,
                  onPrimary: themeColor.colorWhite,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: themeColor.colorBgSecondory,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: themeColor.colorWhite,
                  boxShadow: [globalShadow],
                  borderRadius:
                      BorderRadius.circular(globalRadius.borderRadius_m),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026, 12, 1),
                  onDateChanged: (value) {
                    bookingsController.date.value =
                        value.toString().substring(0, 10);
                    print(value);
                  },
                ),
              ),
            ),
            Gap(Height.heightxl),
            Text(
              "Name",
              style: CustomTextStyles.fontL2SemiBold,
            ),
            Gap(Height.heightMd),
            Container(
              decoration: BoxDecoration(
                color: themeColor.colorWhite,
                boxShadow: [globalShadow],
                borderRadius:
                    BorderRadius.circular(globalRadius.borderRadius_m),
              ),
              child: TextFieldCustom(
                textController: bookingsController.nameController,
                hintText: 'John Doe',
              ),
            ),
            Gap(Height.heightl),
            Text(
              "Guest People",
              style: CustomTextStyles.fontL2SemiBold,
            ),
            Gap(Height.heightMd),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: globalPadding.px_sm,
                vertical: globalPadding.px_xs,
              ),
              decoration: BoxDecoration(
                color: themeColor.colorWhite,
                boxShadow: [globalShadow],
                borderRadius:
                    BorderRadius.circular(globalRadius.borderRadius_m),
              ),
              child: CustomDropDown(
                list: list,
                onChanged: (value) {
                  bookingsController.noOfGuest.value = int.parse(value);
                  print(value);
                },
              ),
            ),
            Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  var amount = (bookingsController.price *
                          bookingsController.noOfGuest.value)
                      .toStringAsFixed(2); // Round to 2 decimal places
                  return Text(
                    "Total Payable Amount \$${amount} USD",
                    style: CustomTextStyles.fontL2SemiBold,
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
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
