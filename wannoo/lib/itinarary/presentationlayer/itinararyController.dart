import 'package:get/get.dart';
import 'package:wannoo/itinarary/datalayer/model/request/favtourrequest.dart';

import '../../Constants.dart';
import '../../homepage/datalayer/model/experiences_model.dart';
import '../datalayer/usecase/getfavtour_usecase.dart';

class ItinararyController extends GetxController {
  final GetFavToursUseCase getFavToursUseCase;

  @override
  void onInit() {
    final String? id = Get.parameters["id"];
    getFavTours(int.parse(id ?? ""));
    super.onInit();
  }

  ItinararyController({
    required this.getFavToursUseCase,
  });

  final RxList<ExperiencesModel> savedTours = <ExperiencesModel>[].obs;

  void getFavTours(int id) async {
    try {
      await getFavToursUseCase.execute(FavTourRequest(id: id)).then((response) {
        savedTours.assignAll(response.map((tour) => ExperiencesModel(
            id: tour.tourId ?? 0,
            title: tour.tourName ?? "No name",
            // Replace `title` with the actual property from `tour`
            imagepath: '${baseurl}/${tour.imagePath ?? ""}',
            // Adjust the path as per your model structure
            location: tour.cityName ?? "",
            Category: tour.cityTourType ?? "",
            // Replace `location` with the actual property
            Country: tour.countryName,
            Continent: tour.continent,
            internaTourid: tour.id ?? 0,
            price: tour.tourpricing?.amount ?? 0)));
      });
    } catch (e) {
      print(e);
    }
  }
}
