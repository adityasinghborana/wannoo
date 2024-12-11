import 'package:json_annotation/json_annotation.dart';
part 'post_fav_tour.g.dart';

@JsonSerializable()
class PostFavTourRequest {
  final int itineraryId;
  final int tourId;
  final int userId;
  PostFavTourRequest(
      {required this.itineraryId, required this.tourId, required this.userId});

  factory PostFavTourRequest.fromJson(Map<String, dynamic> json) =>
      _$PostFavTourRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PostFavTourRequestToJson(this);
}
