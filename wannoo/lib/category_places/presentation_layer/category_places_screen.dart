import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/category_places/presentation_layer/category_places_controller.dart';
import 'package:wannoo/components/empty_state.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/extension.dart';
import '../../components/places_card.dart';

class CategoryPlacesScreen extends StatelessWidget {
  final String? category = Get.parameters["category"];

  CategoryPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryPlacesController = Get.put(CategoryPlacesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(category ?? ""),
      ),
      body: categoryPlacesController.places.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: categoryPlacesController.places.length,
              itemBuilder: (context, index) {
                final item = categoryPlacesController.places[index];
                return PlacesCard(
                  title: item.title,
                  image: item.imagepath,
                  location: item.location,
                  onTap: () {
                    Get.toNamed(AppRoutes.placedetails, parameters: {
                      'amount': categoryPlacesController.places[index].price
                          .toString(),
                      'id': "${categoryPlacesController.places[index].id}"
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 24),
            ).fadeIn(
              duration: const Duration(seconds: 1),
            )
          : Center(
              child: dataNotFound(
                width: double.infinity,
                height: 300.00,
              ),
            ),
    );
  }
}
