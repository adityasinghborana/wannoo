import 'package:json_annotation/json_annotation.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetail {
  final int id;
  final String uid;
  final String? username;
  final bool? isUser;
  final String email;
  final String? address;
  final int? age;
  final String? dob;
  final String? profileImage;

  UserDetail(
      {required this.id,
      required this.uid,
      required this.username,
      required this.isUser,
      required this.email,
      required this.address,
      required this.age,
      required this.dob,
      this.profileImage});

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
