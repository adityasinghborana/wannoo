import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class UserModel {
  String uid;

  String email;

  // Add other fields and relationships as needed

  UserModel({
    required this.uid,
    required this.email,

    // Add other fields and relationships as needed
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
