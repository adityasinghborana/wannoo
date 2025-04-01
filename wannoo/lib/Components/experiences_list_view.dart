import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/empty_state.dart';
import 'package:wannoo/components/experiences_card.dart';
import 'package:wannoo/routes.dart';
import '../homepage/data_layer/model/experiences_model.dart';
import '../homepage/presentation_layer/homepage_controller.dart';

class ExperiencesListview extends StatelessWidget {
  final HomePageController homePageController = Get.find();
  final bool isFilteredList;
  final String filterProperty;

  ExperiencesListview(
      {super.key, this.filterProperty = '', this.isFilteredList = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.textScalerOf(context).scale(220),
      child: Obx(() {
        List<ExperiencesModel> filteredTours =
            homePageController.experiences.where((tour) {
          // Check if filterProperty is empty and return all tours
          if (!isFilteredList) {
            return true; // Show all tours if no filter is applied
          }

          // Apply filtering logic based on filterProperty
          switch (filterProperty) {
            case 'Festivals':
              return tour.category == "Festivals";
            case 'Hiking':
              return tour.category == "Hiking";
            case 'Beach Tour':
              return tour.category == "Beach Tour";
            case 'Cultural Tour':
              return tour.category == "Cultural Tour";
            default:
              return false; // Include all tours if filterProperty doesn't match any case
          }
        }).toList();

        // Check if filteredTours is empty, show "dataNotFound" if true
        if (filteredTours.isEmpty) {
          return dataNotFound(width: Get.width, height: 150.00);
        }

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: filteredTours.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return ExperiencesCard(
              price: filteredTours[index].price ?? 0.0,
              selectedTourId: filteredTours[index].internaTourid,
              isfav: true,
              title: filteredTours[index].title,
              imagePath: filteredTours[index].imagepath,
              location: filteredTours[index].location,
              onTap: () {
                Get.toNamed(AppRoutes.placedetails, parameters: {
                  'id': "${filteredTours[index].id}",
                  'amount': filteredTours[index].price.toString(),
                });
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        );
      }),
    );
  }
}
