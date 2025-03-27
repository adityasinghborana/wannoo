import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/search/data_layer/model/response/city_response.dart';
import 'package:wannoo/search/data_layer/model/response/continentsreponse.dart';
import 'package:wannoo/search/data_layer/model/response/country_response.dart';

import '../../../constants.dart';
part 'continentremote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ContinentRemote {
  factory ContinentRemote(Dio dio, {String? baseUrl}) =
      _ContinentRemote;

  @GET('/continents')
  Future<List<AllContinents>> getContinenets();

  @GET('/countries')
  Future<List<CountryResponse>> getCountries({
    @Query('name',encoded: false) required String name,
});
  @GET('/cities')
  Future<List<CityResponse>> getCities({
    @Query('countryName',encoded: false) required String countryName,
  });

}


