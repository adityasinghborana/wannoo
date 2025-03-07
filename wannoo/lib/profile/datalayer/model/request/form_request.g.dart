// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormRequest _$FormRequestFromJson(Map<String, dynamic> json) => FormRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FormRequestToJson(FormRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
    };
