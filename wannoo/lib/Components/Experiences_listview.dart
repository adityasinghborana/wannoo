import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/EmptyState.dart';
import 'package:wannoo/Components/experiences_card.dart';
import 'package:wannoo/routes.dart';
import '../homepage/datalayer/model/experiences_model.dart';
import '../homepage/presentationlayer/homepage_controller.dart';

class ExperiencesListview extends StatelessWidget {
  final HomePageController homePageController = Get.find();
  final bool isFilteredList;
  final String filterProperty;

  ExperiencesListview({this.filterProperty = '', this.isFilteredList = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5,
      width: Get.width,
      child: Obx(() {
        List<ExperiencesModel> filteredTours =
            homePageController.experiences.where((tour) {
          // Check if filterProperty is empty and return all tours
          if (!isFilteredList) {
            return true; // Show all tours if no filter is applied
          }

          // Apply filtering logic based on filterProperty
          switch (filterProperty) {
            case 'Landmark Tour':
              return tour.Category == "Landmark Tour";
            case 'Hiking':
              return tour.Category == "Hiking";
            case 'Beach Tour':
              return tour.Category == "Beach Tour";
            case 'Cultural Tour':
              return tour.Category == "Cultural Tour";
            default:
              return false; // Include all tours if filterProperty doesn't match any case
          }
        }).toList();

        // Check if filteredTours is empty, show "dataNotFound" if true
        if (filteredTours.isEmpty) {
          return dataNotFound(width: Get.width, height: 150.00);
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filteredTours.length,
          itemBuilder: (context, index) {
            print("imagepath ${filteredTours[6].imagepath}");
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.placedetails, parameters: {
                  'id': "${filteredTours[index].id}",
                  'amount': "${filteredTours[index].price.toString()}",
                });
              },
              child: ExperiencesCard(
                price: filteredTours[index].price ?? 0.0,
                selectedTourId: filteredTours[index].internaTourid,
                isfav: true,
                title: filteredTours[index].title,
                imagePath: filteredTours[index].imagepath,
                location: filteredTours[index].location,
              ),
            );
          },
        );
      }),
    );
  }
}
