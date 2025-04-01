// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_screen_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalScreenResponseModel _$LegalScreenResponseModelFromJson(
        Map<String, dynamic> json) =>
    LegalScreenResponseModel(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LegalScreenResponseModelToJson(
        LegalScreenResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
