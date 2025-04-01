import 'package:json_annotation/json_annotation.dart';

part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  final int? id;
  final String? email;
  final String? address;
  final dynamic age;
  final dynamic dob;
  final bool? isUser;
  final String? uid;
  final String? username;

  const UpdateUserResponse({
    this.id,
    this.email,
    this.address,
    this.age,
    this.dob,
    this.isUser,
    this.uid,
    this.username,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}
