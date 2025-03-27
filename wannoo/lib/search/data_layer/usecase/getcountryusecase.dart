import 'package:wannoo/search/data_layer/model/request/countryrequest.dart';
import 'package:wannoo/search/data_layer/model/response/country_response.dart';
import 'package:wannoo/search/data_layer/repository/repository.dart';

class GetCountriesUseCase {
  final ContinentRepo repository;

  GetCountriesUseCase(this.repository);

  Future<List<CountryResponse>> execute(CountriesRequest data) {
    return repository.getCountries(data.name);
  }
}
