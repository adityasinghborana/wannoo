import 'package:wannoo/places_detail/datalayer/service/remote.dart';

import '../model/request/placesdetails.dart';
import '../model/response/Placesdetails.dart';

abstract class PlaceDetailsRepository {
  Future<PlaceDetails> getPlaceDetails(PlacesDetailRequest data);
}

@override
class PlaceDetailsRepositoryImpl implements PlaceDetailsRepository {
  final GetPlacesDetails remote;

  PlaceDetailsRepositoryImpl(this.remote);

  @override
  Future<PlaceDetails> getPlaceDetails(PlacesDetailRequest data) {
    return remote.getPlaces(id: data.id);
  }
}
