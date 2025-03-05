import 'package:json_annotation/json_annotation.dart';

part 'create_itinarary_request.g.dart';

@JsonSerializable()
class CreateItinararyRequest {
  final String? name;
  final String? uid;

  const CreateItinararyRequest({this.name, required this.uid});

  factory CreateItinararyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateItinararyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateItinararyRequestToJson(this);
}
