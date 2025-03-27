// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_screen_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalScreenRequestModel _$LegalScreenRequestModelFromJson(
        Map<String, dynamic> json) =>
    LegalScreenRequestModel(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$LegalScreenRequestModelToJson(
        LegalScreenRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
