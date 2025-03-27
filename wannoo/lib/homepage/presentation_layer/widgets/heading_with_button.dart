import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/text_button.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/routes.dart';

class HeadingwithButton extends StatelessWidget {
  final String label;
  final bool isVisible;
  const HeadingwithButton(
      {super.key, required this.label, this.isVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalPadding.px_md, vertical: GlobalPadding.py_md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: CustomTextStyles.fontXlMedium,
          ),
          isVisible
              ? CustomTextButton(
                  onpressed: () {
                    Get.toNamed(AppRoutes.allcategories);
                  },
                  label: 'See All')
              : Container(),
        ],
      ),
    );
  }
}
