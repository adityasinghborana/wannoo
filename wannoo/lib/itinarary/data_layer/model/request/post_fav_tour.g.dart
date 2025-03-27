// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_fav_tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFavTourRequest _$PostFavTourRequestFromJson(Map<String, dynamic> json) =>
    PostFavTourRequest(
      itineraryId: (json['itineraryId'] as num).toInt(),
      tourId: (json['tourId'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$PostFavTourRequestToJson(PostFavTourRequest instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'tourId': instance.tourId,
      'userId': instance.userId,
    };
