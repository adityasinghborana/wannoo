// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      passengers: (json['passengers'] as num?)?.toInt(),
      tourDate: json['tourDate'] as String?,
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      roleId: json['roleId'],
      tourId: (json['tourId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'fullName': instance.fullName,
      'email': instance.email,
      'passengers': instance.passengers,
      'tourDate': instance.tourDate,
      'serviceTotal': instance.serviceTotal,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'tourId': instance.tourId,
      'createdAt': instance.createdAt,
    };
