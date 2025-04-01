import 'package:json_annotation/json_annotation.dart';

part 'city_request.g.dart';

@JsonSerializable()
class CityRequest {
  final String? countryName;

  const CityRequest({
    this.countryName,
  });

  factory CityRequest.fromJson(Map<String, dynamic> json) =>
      _$CityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CityRequestToJson(this);
}
