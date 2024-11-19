// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continentsreponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllContinents _$AllContinentsFromJson(Map<String, dynamic> json) =>
    AllContinents(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AllContinentsToJson(AllContinents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
