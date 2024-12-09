import 'package:get/get.dart';

import '../../Constants.dart';
import '../../homepage/datalayer/model/experiences_model.dart';
import '../datalayer/usecase/getfavtour_usecase.dart';

class ItinararyController extends GetxController {
  final GetFavToursUseCase getFavToursUseCase;
  @override
  void onInit() {
    getFavTours();
    super.onInit();
  }

  ItinararyController({
    required this.getFavToursUseCase,
  });

  final RxList<ExperiencesModel> savedTours = <ExperiencesModel>[].obs;

  void getFavTours() async {
    await getFavToursUseCase.execute().then((response) {
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
          internaTourid: tour.id ?? 0)));
    });
  }
}
