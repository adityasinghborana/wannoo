import 'package:json_annotation/json_annotation.dart';

part 'user_itinarary_request.g.dart';

@JsonSerializable()
class UserItinararyRequest {
  final String? uid;

  const UserItinararyRequest({
    this.uid,
  });

  factory UserItinararyRequest.fromJson(Map<String, dynamic> json) =>
      _$UserItinararyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserItinararyRequestToJson(this);
}
