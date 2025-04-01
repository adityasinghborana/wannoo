import 'package:json_annotation/json_annotation.dart';
part 'countryrequest.g.dart';

@JsonSerializable()
class CountriesRequest {
  final String name;
  CountriesRequest({required this.name});

  factory CountriesRequest.fromJson(Map<String, dynamic> json) =>
      _$CountriesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesRequestToJson(this);
}
