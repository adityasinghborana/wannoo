import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wannoo/places_detail/data_layer/model/request/placesdetails.dart';
import 'package:wannoo/places_detail/data_layer/usecase/get_places_details_usecase.dart';

import '../../constants.dart';
import '../data_layer/model/placedetails.dart';

class PlacedetailsController extends GetxController {
  final GetPlaceDetailsUseCase getPlaceDetailsUseCase;

  PlacedetailsController({required this.getPlaceDetailsUseCase});

  @override
  void onInit() {
    final String? amount = Get.parameters['amount'];
    passedAmount.value = amount ?? "";
    final String? id = Get.parameters['id'];
    getPlaceData(id ?? "");
    super.onInit();
  }

  var passedAmount = "".obs;
  final Rx<PlacedetailsModel> demoData = PlacedetailsModel().obs;
  RxList<ImageModel> imagePaths = <ImageModel>[].obs;

  void getPlaceData(String placeId) {
    getPlaceDetailsUseCase
        .execute(PlacesDetailRequest(id: placeId))
        .then((response) {
      // Map response data to a single PlacedetailsModel instance
      imagePaths.assignAll(response.tourImages
              ?.map((image) => ImageModel(
                    imagepath: image.imagePath ?? "",
                  ))
              .toList() ??
          []);

      demoData.value = PlacedetailsModel(
        tourId: response.TourId ?? 0,
        country: response.countryName ?? "",
        id: response.id ?? 0,
        reviews: 120,
        images: response.tourImages
                ?.map((image) => ImageModel(
                      imagepath: '$baseurl/${image.imagePath ?? ""}',
                    ))
                .toList() ??
            [],
        rating: 4.9,
        price: double.parse(passedAmount.value),
        title: response.tourName ?? "",
        description: response.tourDescription ?? "",
        facilities: response.importantInformation ?? "",
        exampleItinerary: response.importantInformation ?? "",
        culturalAndNearbyEvents: response.itenararyDescription ?? "",
        safety: response.tourInclusion ?? "",
        entryInfo: response.tourShortDescription ?? "",
        accommodation: response.usefulInformation ?? "",
        budget: '500',
        bookable: response.Bookable,
        faq: response.faq
                ?.map((faq) => Faq(
                      id: faq
                          .id, // Adjust the key names according to your map structure
                      question: faq.question,
                      answer: faq.answer,
                    ))
                .toList() ??
            [],
      );
    }).catchError((error) {
      debugPrint("Error occurred: $error");
    });
  }
}
