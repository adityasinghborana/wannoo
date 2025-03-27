import 'package:json_annotation/json_annotation.dart';

part 'delete_user_repsonse.g.dart';

@JsonSerializable()
class DeleteUserResponse {
  final String? message;

  const DeleteUserResponse({
    this.message,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserResponseToJson(this);
}
