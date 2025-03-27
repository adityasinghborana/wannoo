import 'package:json_annotation/json_annotation.dart';

part 'delete_user_fav_tour_request.g.dart';

@JsonSerializable()
class DeleteUserFavTourRequest {
  final String? id;
  final int? itineraryId;
  final int? tourId;

  const DeleteUserFavTourRequest({
    this.id,
    this.itineraryId,
    this.tourId,
  });

  factory DeleteUserFavTourRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserFavTourRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserFavTourRequestToJson(this);
}
