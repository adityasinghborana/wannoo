import 'package:json_annotation/json_annotation.dart';
part 'create_user_response.g.dart';

@JsonSerializable()
class UserModelResponse {
  final int id;
  final String uid;
  final String? username;
  final bool isUser;
  final String email;
  final String? address;
  final int? age;
  final DateTime? dob;

  UserModelResponse({
    required this.id,
    required this.uid,
    this.username,
    required this.isUser,
    required this.email,
    this.address,
    this.age,
    this.dob,
  });

  factory UserModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UserModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelResponseToJson(this);
}
