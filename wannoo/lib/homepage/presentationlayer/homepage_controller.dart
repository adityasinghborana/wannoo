import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/datalayer/model/category_model.dart';
import 'package:wannoo/homepage/datalayer/model/experiences_model.dart';
import 'package:wannoo/homepage/datalayer/model/services_model.dart';

class HomePageController extends GetxController {
  final List<TabItem> items = [
    TabItem(
      icon: Icons.house,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.bookmark_outline_rounded,
      title: 'Saved',
    ),
    TabItem(
      icon: Icons.notifications_none_rounded,
      title: 'Notification',
    ),
    TabItem(
      icon: Icons.chat_rounded,
      title: 'Chat',
    ),
  ];

  final List<CategoryModel> category = [
    CategoryModel(title: 'trek', imagepath: image.Cat1),
    CategoryModel(title: 'trek', imagepath: image.Cat2),
    CategoryModel(title: 'trek', imagepath: image.Cat3),
    CategoryModel(title: 'trek', imagepath: image.Cat4),
  ];
  final List<ExperiencesModel> experiences = [
    ExperiencesModel(title: "Milford sound", imagepath: image.experiencesimages, location: 'newzeland'),
    ExperiencesModel(title: "Zambezi River ", imagepath: image.experiencesimages, location: 'Zimbavbe'),
    ExperiencesModel(title: "Milford Water", imagepath: image.experiencesimages, location: 'Uganda'),


  ];
  final List<ServicesModel> services = [
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),

  ];
}
