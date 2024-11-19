import 'package:flutter/material.dart';

class Item{
  final String title;
  final Widget icon;
  final VoidCallback onpressed;

  const Item({
    required this.title,
    required this.icon,
    required this.onpressed,
  });
}