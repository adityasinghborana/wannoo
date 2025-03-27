import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/blogs/presentation_layer/blogs_screen.dart';
import 'package:wannoo/bookings/presentation_layer/previous_bookings.dart';
import 'package:wannoo/categories/datalayer/repository/allcategoriesrepo.dart';
import 'package:wannoo/categories/datalayer/service/remote.dart';
import 'package:wannoo/categories/datalayer/usecase/allcategoriesusecase.dart';
import 'package:wannoo/homepage/data_layer/repository/alltours.dart';
import 'package:wannoo/homepage/data_layer/service/alltours_remote.dart';
import 'package:wannoo/homepage/data_layer/usecase/get_all_tours_usecase.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/homepage/presentation_layer/screens/home_screen.dart';
import 'package:wannoo/itinarary/data_layer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/data_layer/service/itinarary_remote.dart';
import 'package:wannoo/itinarary/data_layer/usecase/get_itinarary_usecase.dart';
import 'package:wannoo/itinarary/data_layer/usecase/post_fav_tour.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../itinarary/data_layer/usecase/create_itinarary_usecase.dart';
import '../../itinarary/data_layer/usecase/delete_itinarary_usecase.dart';
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
      body: IndexedStack(
        index: visit,
        children: const [
          HomeScreen(),
          Saved(),
          BlogsScreen(),
          PreviousBookings()
        ],
      ).fadeIn(
        duration: const Duration(seconds: 1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: visit,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plane),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.blog),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ticket),
            label: 'Bookings',
          ),
        ],
        onTap: (index) => setState(() => visit = index),
      ),
    );
  }
}
