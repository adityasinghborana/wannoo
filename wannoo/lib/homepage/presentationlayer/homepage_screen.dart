import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Blogs/presentationlayer/blogsscreen.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/bookings/presentationlayer/Previousbookings.dart';
import 'package:wannoo/bookings/presentationlayer/bookingsscreen.dart';
import 'package:wannoo/bookings/presentationlayer/externalSite.dart';
import 'package:wannoo/bookings/presentationlayer/paymentfailure.dart';
import 'package:wannoo/bookings/presentationlayer/paymentsucess.dart';
import 'package:wannoo/categories/datalayer/repository/allcategoriesrepo.dart';
import 'package:wannoo/categories/datalayer/service/remote.dart';
import 'package:wannoo/categories/datalayer/usecase/allcategoriesusecase.dart';
import 'package:wannoo/homepage/datalayer/repository/alltours.dart';
import 'package:wannoo/homepage/datalayer/service/alltours_remote.dart';
import 'package:wannoo/homepage/datalayer/usecase/getalltoursUsecase.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/homepage/presentationlayer/Screens/home_screen.dart';
import 'package:wannoo/itinarary/datalayer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/datalayer/service/itinarary_remote.dart';
import 'package:wannoo/itinarary/datalayer/usecase/get_itinarary_usecase.dart';
import 'package:wannoo/itinarary/datalayer/usecase/post_fav_tour.dart';
import 'package:wannoo/profile/presentationlayer/profilescreen.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../itinarary/datalayer/usecase/create_itinarary_usecase.dart';
import 'Screens/Saved.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(
      HomePageController(
        postFavUseCase: PostFavUseCase(
          itinararyRepoImpl(
            itinararyRemote(Dio()),
          ),
        ),
        getitinararyUseCase: GetitinararyUseCase(
          itinararyRepoImpl(
            itinararyRemote(Dio()),
          ),
        ),
        createItinararyUseCase: CreateItinararyUseCase(
          itinararyRepoImpl(
            itinararyRemote(Dio()),
          ),
        ),
        getAllCategoriesUseCase: GetAllCategoriesUseCase(
          AllCategoriesRepoImpl(
            AllCategoriesRemote(Dio()),
          ),
        ),
        getAllToursUseCase: GetAllToursUseCase(
          AlltoursRepositoryImpl(
            GetAllTours(Dio()),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: themeColor.colorBgPrimary,
      bottomNavigationBar: CurvedNavigationBar(
        index: visit,
        height: 50.0,
        items: homePageController.navigationItems,
        color: themeColor.colorWhite,
        backgroundColor: themeColor.colorBgSecondory,
        onTap: (index) {
          setState(() {
            visit = index;
          });
        },
      ),
      body: IndexedStack(
        index: visit,
        children: [
          HomeScreen(),
          Saved(),
          BlogsScreen(),
          // BookingsScreen(),
          //PaymentFailure()
//PaymentSuccess()
          PreviousBookings()
        ],
      ).fadeIn(duration: Duration(seconds: 1)),
    );
  }
}
