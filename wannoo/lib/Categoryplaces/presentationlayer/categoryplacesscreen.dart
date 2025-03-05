import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Categoryplaces/presentationlayer/categoryplacescontroller.dart';
import 'package:wannoo/Components/EmptyState.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../Components/placescard.dart';
import '../../Constants.dart';

class CategoryPlacesScreen extends StatelessWidget {
  final String? category = Get.parameters["category"];

  CategoryPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(category);
    final CategoryPlacesController categoryPlacesController =
        Get.put(CategoryPlacesController());
    return Scaffold(
        appBar: AppBar(
          title: Text(category ?? ""),
        ),
        body: categoryPlacesController.places.isNotEmpty
            ? ListView.builder(
                itemCount: categoryPlacesController.places.length,
                itemBuilder: (context, index) {
                  final item = categoryPlacesController.places[index];
                  print(item.title);
                  return Padding(
                    padding: EdgeInsets.all(globalPadding.px_sm),
                    child: Container(
                      height: 150,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.placedetails, parameters: {
                            'amount':
                                "${categoryPlacesController.places[index].price.toString()}",
                            'id': "${categoryPlacesController.places[index].id}"
                          });
                        },
                        child: Container(
                          child: PlacesCards(
                            title: item.title,
                            image: item.imagepath,
                            Location: item.location,
                          ),
                        ),
                      ),
                    ),
                  );
                }).fadeIn(duration: Duration(seconds: 1))
            : Center(
                child: dataNotFound(width: double.infinity, height: 300.00)));
  }
}
