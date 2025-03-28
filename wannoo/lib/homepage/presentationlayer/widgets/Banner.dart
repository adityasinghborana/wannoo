import 'package:auraa_ui/aura_ui.dart';
import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class CTA extends StatelessWidget {
  const CTA({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: 250,
        child: AuraUICarousel(
          images: const [
            image.homeimage,
            image.experiencesimages,
          ],
          pageController: pageController,
        ),
      ),

      //
      // Container(
      //   margin: EdgeInsets.symmetric(vertical: 10),
      //   width: double.infinity,
      //   height: Get.height / 4,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       image: DecorationImage(
      //           image: AssetImage(
      //             image.homeimage,
      //           ),
      //           fit: BoxFit.cover)),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Flat 50 % off",
      //         style: CustomTextStyles.fontXxlSemiBold.copyWith(color: themeColor.colorWhite)
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
