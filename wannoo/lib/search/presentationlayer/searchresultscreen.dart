import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/experiences_card.dart';
import 'package:wannoo/Components/placescard.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/search/presentationlayer/SerachresultController.dart';
import 'package:wannoo/utilities/dialog.dart';
import 'package:wannoo/utilities/extension.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchResultController searchResultController =
        Get.put(SearchResultController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Searched Places"),
        centerTitle: true,
      ),
      body: Obx(() {
        print(searchResultController.searchedPlaces.length);
        return ListView.builder(
            itemCount: searchResultController.searchedPlaces.length,
            itemBuilder: (context, index) {
              final item = searchResultController.searchedPlaces[index];
              print(item.title);
              return Padding(
                padding: const EdgeInsets.all(globalPadding.px_sm),
                child: Container(
                    height: 150,
                    child: PlacesCards(
                      title: item.title,
                      image: item.imagepath,
                      Location: item.location,
                    )).fadeIn(duration: Duration(seconds: 1)),
              );
            });
      }),
    );
  }
}
