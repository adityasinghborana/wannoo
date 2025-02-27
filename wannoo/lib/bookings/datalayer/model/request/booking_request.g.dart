// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      passengers: (json['passengers'] as num).toInt(),
      tourDate: json['tourDate'] as String,
      serviceTotal: (json['serviceTotal'] as num).toDouble(),
      userId: json['userId'] as String,
      roleId: json['roleId'] as String,
      tourId: (json['tourId'] as num).toInt(),
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'status': instance.status,
      'passengers': instance.passengers,
      'tourDate': instance.tourDate,
      'serviceTotal': instance.serviceTotal,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'tourId': instance.tourId,
    };
