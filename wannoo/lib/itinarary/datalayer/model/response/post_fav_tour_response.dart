import 'package:json_annotation/json_annotation.dart';

part 'post_fav_tour_response.g.dart';

@JsonSerializable()
class PostFavTourResponse {
  final int? id;
  final int? userId;
  final int? tourId;
  final int? itineraryId;

  const PostFavTourResponse({
    this.id,
    this.userId,
    this.tourId,
    this.itineraryId,
  });

  factory PostFavTourResponse.fromJson(Map<String, dynamic> json) =>
      _$PostFavTourResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostFavTourResponseToJson(this);
}
