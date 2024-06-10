import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/homepage/presentationlayer/Screens/home_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int visit = 0;
  @override
  Widget build(BuildContext context) {

    final HomePageController homePageController  = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: themeColor.colorBgPrimary,
      bottomNavigationBar:Material(
        elevation: 30,
        child: BottomBarDefault(
          enableShadow: true,
          items: homePageController.items,
          backgroundColor: themeColor.colorBgPrimary,
          color: themeColor.navbarColor,
          blur: 4,
          indexSelected: visit,
          colorSelected: themeColor.colorBgSecondory,
          onTap: (int index) => setState(() {
            visit = index;
          }),
        ),
      ),
      body: IndexedStack(
        index: visit,
        children: [
          HomeScreen(),
          Center(child: Text('Shop')),
          Center(child: Text('Wishlist')),
          Center(child: Text('Cart')),

        ],
      ),
    );
  }
}
