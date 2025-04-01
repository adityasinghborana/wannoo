// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_fav_tour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserFavTourResponse _$DeleteUserFavTourResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteUserFavTourResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
      itineraryId: (json['itineraryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteUserFavTourResponseToJson(
        DeleteUserFavTourResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tourId': instance.tourId,
      'itineraryId': instance.itineraryId,
    };
