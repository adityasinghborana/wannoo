// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_itinarary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteItinararyResponse _$DeleteItinararyResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteItinararyResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeleteItinararyResponseToJson(
        DeleteItinararyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
    };
