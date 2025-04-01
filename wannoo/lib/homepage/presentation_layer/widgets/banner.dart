import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class CTA extends StatelessWidget {
  final PageController pageController = PageController();
  CTA({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 240),
      child: CarouselView.weighted(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        flexWeights: const [1, 10, 1],
        children: [
          Image.asset(
            StaticImage.homeimage,
            fit: BoxFit.cover,
          ),
          Image.asset(
            StaticImage.experiencesimages,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
