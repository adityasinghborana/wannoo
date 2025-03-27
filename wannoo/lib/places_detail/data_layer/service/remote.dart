import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/places_detail/data_layer/model/response/Placesdetails.dart';

import '../../../constants.dart';
part 'remote.g.dart';


@RestApi(baseUrl: baseurl)
abstract class GetPlacesDetails {
  factory GetPlacesDetails(Dio dio, {String? baseUrl}) = _GetPlacesDetails;

  @GET('/tourdetails') // Change to include the path parameter
  Future<PlaceDetails> getPlaces({
    @Query('id',encoded: false) required String id, // Use @Path for path parameter
  });
}
