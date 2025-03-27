import 'package:json_annotation/json_annotation.dart';
part 'favtourrequest.g.dart';

@JsonSerializable()
class FavTourRequest {
  final int id;
  FavTourRequest({required this.id});

  factory FavTourRequest.fromJson(Map<String, dynamic> json) =>
      _$FavTourRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FavTourRequestToJson(this);
}
