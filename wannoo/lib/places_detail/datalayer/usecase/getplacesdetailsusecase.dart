import 'package:wannoo/places_detail/datalayer/model/request/placesdetails.dart';
import 'package:wannoo/places_detail/datalayer/model/response/Placesdetails.dart';

import '../repository/placeDetailsrepo.dart';

class GetPlaceDetailsUseCase {
  final PlaceDetailsRepository repository;

  GetPlaceDetailsUseCase(this.repository);

  Future<PlaceDetails> execute( PlacesDetailRequest data) {
    return repository.getPlaceDetails(data);
  }
}