// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_fav_tour_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserFavTourRequest _$DeleteUserFavTourRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteUserFavTourRequest(
      id: json['id'] as String?,
      itineraryId: (json['itineraryId'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteUserFavTourRequestToJson(
        DeleteUserFavTourRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itineraryId': instance.itineraryId,
      'tourId': instance.tourId,
    };
