import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  const Introduction({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.titleTextStyle = const TextStyle(fontSize: 30),
    this.subTitleTextStyle = const TextStyle(fontSize: 20),
    this.imageWidth = 360,
    this.imageHeight = 360,
  });

  @override
  State<StatefulWidget> createState() {
    return IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage(widget.imageUrl),
                height: widget.imageHeight,
                width: widget.imageWidth,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: widget.titleTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.subTitle,
              style: widget.subTitleTextStyle,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
