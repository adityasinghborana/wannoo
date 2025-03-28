import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/snackbar.dart';
import 'package:wannoo/itinarary/datalayer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/favtourrequest.dart';
import 'package:wannoo/utilities/Authclass.dart';

import '../../Constants.dart';
import '../../homepage/datalayer/model/experiences_model.dart';
import '../datalayer/usecase/delete_fav_tour.dart';
import '../datalayer/usecase/getfavtour_usecase.dart';

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
            Category: tour.cityTourType ?? "",
            Country: tour.countryName,
            Continent: tour.continent,
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
                color: themeColor.colorBgPrimary,
              ));
          getFavTours(int.parse(itinaryid.value ?? ""));
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
