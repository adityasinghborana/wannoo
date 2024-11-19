// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Placesdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) => PlaceDetails(
      id: (json['id'] as num?)?.toInt(),
      countryId: (json['countryId'] as num?)?.toInt(),
      countryName: json['countryName'] as String?,
      continent: json['continent'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
      Bookable: json['Bookable'] as bool?,
      tourName: json['tourName'] as String?,
      duration: json['duration'] as String?,
      imagePath: json['imagePath'] as String?,
      cityTourTypeId: json['cityTourTypeId'] as String?,
      cityTourType: json['cityTourType'] as String?,
      tourDescription: json['tourDescription'] as String?,
      tourInclusion: json['tourInclusion'] as String?,
      tourShortDescription: json['tourShortDescription'] as String?,
      importantInformation: json['importantInformation'] as String?,
      itenararyDescription: json['itenararyDescription'] as String?,
      usefulInformation: json['usefulInformation'] as String?,
      childAge: json['childAge'] as String?,
      infantAge: json['infantAge'] as String?,
      infantCount: (json['infantCount'] as num?)?.toInt(),
      isSlot: json['isSlot'] as bool?,
      onlyChild: json['onlyChild'] as bool?,
      startTime: json['startTime'] as String?,
      meal: json['meal'] as String?,
      googleMapUrl: json['googleMapUrl'] as String?,
      tourExclusion: json['tourExclusion'] as String?,
      tourId: (json['tourId'] as num?)?.toInt(),
      cutOffhrs: (json['cutOffhrs'] as num?)?.toInt(),
      vendorUid: json['vendorUid'] as String?,
      isVendorTour: json['isVendorTour'] as bool?,
      tourImages: (json['tourImages'] as List<dynamic>?)
          ?.map((e) => TourImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      tourOption: (json['tourOption'] as List<dynamic>?)
          ?.map((e) => TourOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      faq: (json['faq'] as List<dynamic>?)
          ?.map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceDetailsToJson(PlaceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'continent': instance.continent,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'duration': instance.duration,
      'imagePath': instance.imagePath,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'tourDescription': instance.tourDescription,
      'tourInclusion': instance.tourInclusion,
      'tourShortDescription': instance.tourShortDescription,
      'importantInformation': instance.importantInformation,
      'itenararyDescription': instance.itenararyDescription,
      'usefulInformation': instance.usefulInformation,
      'childAge': instance.childAge,
      'infantAge': instance.infantAge,
      'infantCount': instance.infantCount,
      'isSlot': instance.isSlot,
      'Bookable': instance.Bookable,
      'onlyChild': instance.onlyChild,
      'startTime': instance.startTime,
      'meal': instance.meal,
      'googleMapUrl': instance.googleMapUrl,
      'tourExclusion': instance.tourExclusion,
      'tourId': instance.tourId,
      'cutOffhrs': instance.cutOffhrs,
      'vendorUid': instance.vendorUid,
      'isVendorTour': instance.isVendorTour,
      'tourImages': instance.tourImages,
      'tourOption': instance.tourOption,
      'faq': instance.faq,
    };

TourImage _$TourImageFromJson(Map<String, dynamic> json) => TourImage(
      id: (json['id'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$TourImageToJson(TourImage instance) => <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'imagePath': instance.imagePath,
    };

TourOption _$TourOptionFromJson(Map<String, dynamic> json) => TourOption(
      id: (json['id'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
      optionName: json['optionName'] as String?,
      childAge: json['childAge'] as String?,
      infantAge: json['infantAge'] as String?,
      optionDescription: json['optionDescription'] as String?,
      minPax: (json['minPax'] as num?)?.toInt(),
      maxPax: (json['maxPax'] as num?)?.toInt(),
      isWithoutTransfers: json['isWithoutTransfers'] as bool?,
      isSharingTransfer: json['isSharingTransfer'] as bool?,
      isPrivateTransfer: json['isPrivateTransfer'] as bool?,
      isPrivateBoatWithoutTransfers:
          json['isPrivateBoatWithoutTransfers'] as bool?,
      isPvtYachtWithoutTransfers: json['isPvtYachtWithoutTransfers'] as bool?,
      tourOptionId: (json['tourOptionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TourOptionToJson(TourOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'optionName': instance.optionName,
      'childAge': instance.childAge,
      'infantAge': instance.infantAge,
      'optionDescription': instance.optionDescription,
      'minPax': instance.minPax,
      'maxPax': instance.maxPax,
      'isWithoutTransfers': instance.isWithoutTransfers,
      'isSharingTransfer': instance.isSharingTransfer,
      'isPrivateTransfer': instance.isPrivateTransfer,
      'isPrivateBoatWithoutTransfers': instance.isPrivateBoatWithoutTransfers,
      'isPvtYachtWithoutTransfers': instance.isPvtYachtWithoutTransfers,
      'tourOptionId': instance.tourOptionId,
    };

Faq _$FaqFromJson(Map<String, dynamic> json) => Faq(
      (json['id'] as num).toInt(),
      json['question'] as String,
      json['answer'] as String,
    );

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
