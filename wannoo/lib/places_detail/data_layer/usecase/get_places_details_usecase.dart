import 'package:wannoo/places_detail/data_layer/model/request/placesdetails.dart';
import 'package:wannoo/places_detail/data_layer/model/response/places_details.dart';

import '../repository/place_details_repository.dart';

class GetPlaceDetailsUseCase {
  final PlaceDetailsRepository repository;

  GetPlaceDetailsUseCase(this.repository);

  Future<PlaceDetails> execute(PlacesDetailRequest data) {
    return repository.getPlaceDetails(data);
  }
}
