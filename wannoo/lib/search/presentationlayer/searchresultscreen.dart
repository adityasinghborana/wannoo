import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/empty_state.dart';
import 'package:wannoo/Components/places_card.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/search/presentationlayer/serach_result_controller.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../routes.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchResultController searchResultController =
        Get.put(SearchResultController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Searched Places"),
        centerTitle: true,
      ),
      body: Obx(() {
        print(searchResultController.searchedPlaces.length);

        return searchResultController.searchedPlaces.isEmpty
            ? Center(child: dataNotFound(width: 300.00, height: 400.00))
            : ListView.builder(
                itemCount: searchResultController.searchedPlaces.length,
                itemBuilder: (context, index) {
                  final item = searchResultController.searchedPlaces[index];
                  print(item.title);
                  return Padding(
                    padding: const EdgeInsets.all(GlobalPadding.px_sm),
                    child: SizedBox(
                        height: 150,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.placedetails, parameters: {
                              'amount': item.price.toString(),
                              'id': "${item.id}"
                            });
                          },
                          child: PlacesCards(
                            title: item.title,
                            image: item.imagepath,
                            location: item.location,
                          ),
                        )).fadeIn(duration: const Duration(seconds: 1)),
                  );
                });
      }),
    );
  }
}
