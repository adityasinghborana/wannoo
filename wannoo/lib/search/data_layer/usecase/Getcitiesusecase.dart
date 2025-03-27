import 'package:wannoo/search/data_layer/model/response/city_response.dart';
import 'package:wannoo/search/data_layer/repository/repository.dart';

class GetCitiesUsecase {
  final ContinentRepo repository;

  GetCitiesUsecase(this.repository);


  Future<List<CityResponse>> execute(String countryName) {
    return repository.getCities(countryName);
  }
}
