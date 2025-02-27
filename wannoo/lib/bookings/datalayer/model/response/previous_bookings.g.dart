// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousBookings _$PreviousBookingsFromJson(Map<String, dynamic> json) =>
    PreviousBookings(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      passengers: (json['passengers'] as num?)?.toInt(),
      tourDate: json['tourDate'] as String?,
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      roleId: json['roleId'] as String?,
      tourId: (json['tourId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      tour: json['tour'] == null
          ? null
          : Tour.fromJson(json['tour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreviousBookingsToJson(PreviousBookings instance) =>
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
      'tour': instance.tour,
    };

Tour _$TourFromJson(Map<String, dynamic> json) => Tour(
      cityName: json['cityName'] as String?,
      tourName: json['tourName'] as String?,
    );

Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'tourName': instance.tourName,
    };
