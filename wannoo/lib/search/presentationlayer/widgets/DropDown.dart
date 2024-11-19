import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';

class CustomDropDown extends StatelessWidget {
  final RxList<String> list;
  final RxString dropdownValue = "".obs;
  final ValueChanged<String> onChanged;

  CustomDropDown({
    Key? key,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!list.contains(dropdownValue.value)) {
        dropdownValue.value = ""; // Reset dropdown value
      }

      return DropdownButton<String>(
        borderRadius:BorderRadius.circular(globalRadius.borderRadius_m),

        dropdownColor:themeColor.colorWhite,
        isExpanded: true,
        menuMaxHeight: Get.height/4,
        menuWidth:Get.width,
        hint:  Text("Select Option", style:  CustomTextStyles.fontMdSemiBold.copyWith(color: themeColor.colorTextSecondry),),
        value: dropdownValue.value.isEmpty ? null : dropdownValue.value,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: const TextStyle(color: themeColor.colorTextPrimary),
        underline: const SizedBox.shrink(),
        onChanged: (String? value) {
          if (value != null) {
            dropdownValue.value = value; // Update the reactive value
            onChanged.call(value); // Call the passed onChanged callback
          } else {
            const snackBar = SnackBar(content: Text("Select Option"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: CustomTextStyles.fontMdSemiBold,),
          );
        }).toList(),
      );
    });
  }
}
