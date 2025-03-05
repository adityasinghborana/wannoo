import 'package:json_annotation/json_annotation.dart';

part 'delete_user_request.g.dart';

@JsonSerializable()
class DeleteUserRequest {
  final String? uid;

  const DeleteUserRequest({
    this.uid,
  });

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);
}
