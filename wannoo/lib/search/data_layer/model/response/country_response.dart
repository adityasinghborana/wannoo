// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {
  final int? CountryId;
  final String? name;
  final int? continentId;
  final dynamic image;

  const CountryResponse({
    this.CountryId,
    this.name,
    this.continentId,
    this.image,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
