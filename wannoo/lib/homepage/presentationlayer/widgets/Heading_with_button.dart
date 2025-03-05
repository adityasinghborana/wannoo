import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/text_button.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/styles.dart';

class HeadingwithButton extends StatelessWidget {
  final String label;
  final bool isVisible;
  const HeadingwithButton(
      {super.key, required this.label, this.isVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: globalPadding.px_md, vertical: globalPadding.py_md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: CustomTextStyles.fontXxlMedium,
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
