import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannoo/constants.dart';

import 'circle_progress_bar.dart';
import 'introduction.dart';

/// A IntroScreen Class.

class IntroScreenOnboarding extends StatefulWidget {
  final List<Introduction>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;

  /// Callback on Skip Button Pressed
  final Function()? onTapSkipButton;
  const IntroScreenOnboarding({
    Key? key,
    this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);

  @override
  State<IntroScreenOnboarding> createState() => _IntroScreenOnboardingState();
}

class _IntroScreenOnboardingState extends State<IntroScreenOnboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: ThemeColor.colorBgPrimary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: widget.onTapSkipButton,
                        child: Text('Skip', style: widget.skipTextStyle),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: widget.introductionList!,
                  ),
                ),

                _customProgress(),
                //_buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            foregroundColor:
                widget.foregroundColor ?? Theme.of(context).primaryColor,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList!.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (widget.foregroundColor ?? Theme.of(context).primaryColor)
                .withValues(alpha: 0.5),
          ),
          child: IconButton(
            onPressed: () {
              _currentPage != widget.introductionList!.length - 1
                  ? _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : widget.onTapSkipButton!();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}
