import 'package:flutter/material.dart';

Container dataNotFound({required double width, required var height}) {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
    width: width,
    height: height,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      shadows: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 6,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ],
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nothing Found',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}

Container emptyStateColumn({required var width, required var height}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: width * 1.25,
    height: height,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nothing Found',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}

Container loadingStateColumn({required var width, required var height}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: width * 1.25,
    height: height,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(color: Color(0xff7A992D)),
        ),
      ],
    ),
  );
}

Container errorStateColumn({required var width, required var height}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: width * 1.25,
    height: height,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Oops\nSomething went wrong',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}
