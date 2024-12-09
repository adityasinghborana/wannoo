// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinarary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItinararyModel _$ItinararyModelFromJson(Map<String, dynamic> json) =>
    ItinararyModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItinararyModelToJson(ItinararyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
    };
