import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/search/presentationlayer/widgets/DropDown.dart';

import '../../Components/Textfield.dart';
import '../../Components/largeButton2.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<String> list = <String>["1 Person", "2 Persons"].obs;

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
                  borderRadius: BorderRadius.circular(globalRadius.borderRadius_m),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime(2024, 12, 1),
                  firstDate: DateTime(2024, 12, 1),
                  lastDate: DateTime(2026, 12, 1),
                  onDateChanged: (value) {
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
                borderRadius: BorderRadius.circular(globalRadius.borderRadius_m),
              ),
              child: TextFieldCustom(
                textController: TextEditingController(),
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
                borderRadius: BorderRadius.circular(globalRadius.borderRadius_m),
              ),
              child: CustomDropDown(
                list: list,
                onChanged: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            LargeButton2(
              label: "Proceed Checkout",
              onPressed: () {},
              height: Height.heightButtonXLarge,
            ),
          ],
        ),
      ),
    );
  }
}
