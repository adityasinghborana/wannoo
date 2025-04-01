// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      CountryId: (json['CountryId'] as num?)?.toInt(),
      name: json['name'] as String?,
      continentId: (json['continentId'] as num?)?.toInt(),
      image: json['image'],
    );

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'CountryId': instance.CountryId,
      'name': instance.name,
      'continentId': instance.continentId,
      'image': instance.image,
    };
