import 'package:wannoo/search/datalayer/model/request/countryrequest.dart';
import 'package:wannoo/search/datalayer/model/response/country_response.dart';
import 'package:wannoo/search/datalayer/repository/repository.dart';

class GetCountriesUseCase {
  final ContinentRepo repository;

  GetCountriesUseCase(this.repository);

  Future<List<CountryResponse>> execute(CountriesRequest data) {
    return repository.getCountries(data.name);
  }
}