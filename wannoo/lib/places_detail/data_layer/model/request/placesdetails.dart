import 'package:json_annotation/json_annotation.dart';
part 'placesdetails.g.dart';

@JsonSerializable()
class PlacesDetailRequest {
  final String id;

  PlacesDetailRequest({required this.id});

  factory PlacesDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacesDetailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PlacesDetailRequestToJson(this);
}
