// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_fav_tour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFavTourResponse _$PostFavTourResponseFromJson(Map<String, dynamic> json) =>
    PostFavTourResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
      itineraryId: (json['itineraryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostFavTourResponseToJson(
        PostFavTourResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tourId': instance.tourId,
      'itineraryId': instance.itineraryId,
    };
