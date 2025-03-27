import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/snackbar.dart';
import 'package:wannoo/itinarary/data_layer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/favtourrequest.dart';
import 'package:wannoo/utilities/auth_class.dart';

import '../../constants.dart';
import '../../homepage/data_layer/model/experiences_model.dart';
import '../data_layer/usecase/delete_fav_tour.dart';
import '../data_layer/usecase/getfavtour_usecase.dart';

class ItinararyController extends GetxController {
  final GetFavToursUseCase getFavToursUseCase;
  final DeleteFavTourUseCase deleteFavTourUseCase;

  @override
  void onInit() {
    final String? id = Get.parameters["id"];
    getFavTours(int.parse(id ?? ""));
    super.onInit();
  }

  var itinaryid = "".obs;
  ItinararyController({
    required this.getFavToursUseCase,
    required this.deleteFavTourUseCase,
  });

  final RxList<ExperiencesModel> savedTours = <ExperiencesModel>[].obs;

  void getFavTours(int id) async {
    try {
      await getFavToursUseCase.execute(FavTourRequest(id: id)).then((response) {
        savedTours.assignAll(response.map((tour) => ExperiencesModel(
            id: tour.tourId ?? 0,
            title: tour.tourName ?? "No name",
            imagepath: '$baseurl/${tour.imagePath ?? ""}',
            location: tour.cityName ?? "",
            category: tour.cityTourType ?? "",
            country: tour.countryName,
            continent: tour.continent,
            internaTourid: tour.id ?? 0,
            price: tour.tourpricing?.amount ?? 0)));
      });
    } catch (e) {
      print(e);
    }
  }

  void deleteFavTour({required int itinararyId, required int tourId}) async {
    var uid = await getUserUID();
    var data = DeleteUserFavTourRequest(
        id: uid, itineraryId: itinararyId, tourId: tourId);

    print(data.toJson());

    try {
      deleteFavTourUseCase.execute(data).then((e) {
        if (e.id != null) {
          openIconSnackBar(
              Get.context,
              "Fav Tour Deleted",
              const Icon(
                Icons.check_circle_outline,
                color: ThemeColor.colorBgPrimary,
              ));
          getFavTours(int.parse(itinaryid.value));
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
