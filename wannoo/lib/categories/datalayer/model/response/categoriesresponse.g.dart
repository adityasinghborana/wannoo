// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriesresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      (json['id'] as num).toInt(),
      json['image'] as String,
      json['cityTourType'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'cityTourType': instance.cityTourType,
      'image': instance.image,
    };
