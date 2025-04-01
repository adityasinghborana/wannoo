import 'package:wannoo/search/data_layer/model/response/city_response.dart';
import 'package:wannoo/search/data_layer/model/response/continentsreponse.dart';
import 'package:wannoo/search/data_layer/model/response/country_response.dart';
import 'package:wannoo/search/data_layer/service/continent_remote.dart';

abstract class ContinentRepo {
  Future<List<AllContinents>> getAllContinents();
  Future<List<CountryResponse>> getCountries(String continentName);
  Future<List<CityResponse>> getCities(String countryName);
}

@override
class ContinentRepoImpl implements ContinentRepo {
  final ContinentRemote remote;

  ContinentRepoImpl(this.remote);

  @override
  Future<List<AllContinents>> getAllContinents() {
    return remote.getContinenets();
  }

  @override
  Future<List<CountryResponse>> getCountries(String continentName) {
    return remote.getCountries(name: continentName);
  }

  @override
  Future<List<CityResponse>> getCities(String countryName) {
    return remote.getCities(countryName: countryName);
  }
}
