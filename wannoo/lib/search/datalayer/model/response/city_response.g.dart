// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      id: (json['id'] as num?)?.toInt(),
      CityName: json['CityName'] as String?,
      countryId: (json['countryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CityName': instance.CityName,
      'countryId': instance.countryId,
    };
