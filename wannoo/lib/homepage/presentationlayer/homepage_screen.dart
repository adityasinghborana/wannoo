import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Blogs/presentationlayer/blogsscreen.dart';
import 'package:wannoo/bookings/presentationlayer/previous_bookings.dart';
import 'package:wannoo/categories/datalayer/repository/allcategoriesrepo.dart';
import 'package:wannoo/categories/datalayer/service/remote.dart';
import 'package:wannoo/categories/datalayer/usecase/allcategoriesusecase.dart';
import 'package:wannoo/homepage/datalayer/repository/alltours.dart';
import 'package:wannoo/homepage/datalayer/service/alltours_remote.dart';
import 'package:wannoo/homepage/datalayer/usecase/get_all_tours_usecase.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/homepage/presentationlayer/screens/home_screen.dart';
import 'package:wannoo/itinarary/datalayer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/datalayer/service/itinarary_remote.dart';
import 'package:wannoo/itinarary/datalayer/usecase/get_itinarary_usecase.dart';
import 'package:wannoo/itinarary/datalayer/usecase/post_fav_tour.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../itinarary/datalayer/usecase/create_itinarary_usecase.dart';
import '../../itinarary/datalayer/usecase/delete_itinarary_usecase.dart';
import 'screens/saved.dart';

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
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
          ),
        ),
        getitinararyUseCase: GetitinararyUseCase(
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
          ),
        ),
        createItinararyUseCase: CreateItinararyUseCase(
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
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
        deleteItinararyUseCase: DeleteItinararyUseCase(
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: visit,
        height: 50.0,
        items: homePageController.navigationItems,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (index) => setState(() => visit = index),
      ),
      body: IndexedStack(
        index: visit,
        children: const [
          HomeScreen(),
          Saved(),
          BlogsScreen(),
          PreviousBookings()
        ],
      ).fadeIn(duration: const Duration(seconds: 1)),
    );
  }
}
