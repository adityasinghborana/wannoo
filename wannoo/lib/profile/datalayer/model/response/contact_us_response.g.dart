// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResponse _$ContactUsResponseFromJson(Map<String, dynamic> json) =>
    ContactUsResponse(
      id: (json['id'] as num?)?.toInt(),
      Address: json['Address'] as String?,
      mobilenumber: json['mobilenumber'] as String?,
      Email: json['Email'] as String?,
    );

Map<String, dynamic> _$ContactUsResponseToJson(ContactUsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Address': instance.Address,
      'mobilenumber': instance.mobilenumber,
      'Email': instance.Email,
    };
