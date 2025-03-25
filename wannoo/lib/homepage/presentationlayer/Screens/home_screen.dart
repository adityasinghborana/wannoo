import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/Experiences_listview.dart';
import 'package:wannoo/Components/Services%20_listview.dart';
import 'package:wannoo/Components/category_listview.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/Banner.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/home_stack.dart';

import '../../../Components/Textfield.dart';
import '../widgets/Heading_with_button.dart'; // Ensure this import points to your constants file

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeStack(),

          HeadingwithButton(
            label: 'Categories',
            isVisible: true,
          ),

          CustomListCategory(),
          HeadingwithButton(
            label: 'Most Visited',
          ),
          ExperiencesListview(
            filterProperty: ' Festivals',
            isFilteredList: false,
          ),

          HeadingwithButton(
            label: 'Recommended tours',
          ),
          ExperiencesListview(
            filterProperty: 'Trek',
            isFilteredList: false,
          ),
          CTA(),
          HeadingwithButton(
            label: 'Hiking ',
          ),

          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),

          HeadingwithButton(
            label: 'Desert Safari',
          ),

          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
          HeadingwithButton(
            label: 'Top Events',
          ),
          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
          Gap(30)

          // Add more widgets below as needed
        ],
      ),
    );
  }
}
