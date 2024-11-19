import 'package:wannoo/search/datalayer/model/response/city_response.dart';
import 'package:wannoo/search/datalayer/repository/repository.dart';

class GetCitiesUsecase {
  final ContinentRepo repository;

  GetCitiesUsecase(this.repository);


  Future<List<CityResponse>> execute(String countryName) {
    return repository.getCities(countryName);
  }
}