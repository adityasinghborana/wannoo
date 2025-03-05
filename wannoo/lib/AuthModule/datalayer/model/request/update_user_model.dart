import 'package:json_annotation/json_annotation.dart';

part 'update_user_model.g.dart';

@JsonSerializable()
class UpdateUserModel {
  final String? uid;
  final String? username;
  final String? address;

  const UpdateUserModel({
    this.uid,
    this.username,
    this.address,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserModelToJson(this);
}
