import 'package:wannoo/search/datalayer/model/response/city_response.dart';
import 'package:wannoo/search/datalayer/model/response/continentsreponse.dart';
import 'package:wannoo/search/datalayer/model/response/country_response.dart';
import 'package:wannoo/search/datalayer/service/continentremote.dart';

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
