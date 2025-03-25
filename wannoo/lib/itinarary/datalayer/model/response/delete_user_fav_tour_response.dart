import 'package:json_annotation/json_annotation.dart';

part 'delete_user_fav_tour_response.g.dart';

@JsonSerializable()
class DeleteUserFavTourResponse {
  final int? id;
  final int? userId;
  final int? tourId;
  final int? itineraryId;

  const DeleteUserFavTourResponse({
    this.id,
    this.userId,
    this.tourId,
    this.itineraryId,
  });

  factory DeleteUserFavTourResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserFavTourResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserFavTourResponseToJson(this);
}
