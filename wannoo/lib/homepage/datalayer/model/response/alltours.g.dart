// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alltours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ALLTours _$ALLToursFromJson(Map<String, dynamic> json) => ALLTours(
      (json['id'] as num?)?.toInt(),
      (json['tourId'] as num?)?.toInt(),
      json['continent'] as String?,
      (json['countryId'] as num?)?.toInt(),
      json['countryName'] as String?,
      (json['cityId'] as num?)?.toInt(),
      json['cityName'] as String?,
      json['tourName'] as String?,
      json['duration'] as String?,
      json['imagePath'] as String?,
      json['cityTourTypeId'] as String?,
      json['cityTourType'] as String?,
      json['alwaysavailable'] as bool?,
      json['startingdate'] as String?,
      json['endingdate'] as String?,
      json['recommended'] as bool?,
      json['isvisible'] as bool?,
      json['isvisiblePopularTours'] as bool?,
      json['isvisibleReccomendedTours'] as bool?,
      json['isSlot'] as bool?,
      json['isVendorTour'] as bool?,
      json['vendorUid'] as String?,
    );

Map<String, dynamic> _$ALLToursToJson(ALLTours instance) => <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'continent': instance.continent,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'duration': instance.duration,
      'imagePath': instance.imagePath,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'alwaysavailable': instance.alwaysavailable,
      'startingdate': instance.startingdate,
      'endingdate': instance.endingdate,
      'recommended': instance.recommended,
      'isvisible': instance.isvisible,
      'isvisiblePopularTours': instance.isvisiblePopularTours,
      'isvisibleReccomendedTours': instance.isvisibleReccomendedTours,
      'isSlot': instance.isSlot,
      'isVendorTour': instance.isVendorTour,
      'vendorUid': instance.vendorUid,
    };
