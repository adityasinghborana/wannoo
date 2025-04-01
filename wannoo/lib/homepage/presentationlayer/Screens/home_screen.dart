import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wannoo/Components/Experiences_listview.dart';
import 'package:wannoo/Components/category_listview.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/Banner.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/home_stack.dart';

import '../widgets/Heading_with_button.dart'; // Ensure this import points to your constants file

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeStack(),

          const HeadingwithButton(
            label: 'Categories',
            isVisible: true,
          ),

          CustomListCategory(),
          const HeadingwithButton(
            label: 'Most Visited',
          ),
          ExperiencesListview(
            filterProperty: ' Festivals',
            isFilteredList: false,
          ),

          const HeadingwithButton(
            label: 'Recommended tours',
          ),
          ExperiencesListview(
            filterProperty: 'Trek',
            isFilteredList: false,
          ),
          const CTA(),
          const HeadingwithButton(
            label: 'Hiking ',
          ),

          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),

          const HeadingwithButton(
            label: 'Desert Safari',
          ),

          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
          const HeadingwithButton(
            label: 'Top Events',
          ),
          ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
          const Gap(30)

          // Add more widgets below as needed
        ],
      ),
    );
  }
}
