// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResponse _$ContactUsResponseFromJson(Map<String, dynamic> json) =>
    ContactUsResponse(
      id: (json['id'] as num?)?.toInt(),
      address: json['address'] as String?,
      mobilenumber: json['mobilenumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactUsResponseToJson(ContactUsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'mobilenumber': instance.mobilenumber,
      'email': instance.email,
    };
