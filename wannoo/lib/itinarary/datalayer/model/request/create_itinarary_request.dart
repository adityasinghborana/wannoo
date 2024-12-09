import 'package:json_annotation/json_annotation.dart';

part 'create_itinarary_request.g.dart';

@JsonSerializable()
class CreateItinararyRequest {
  final String? name;

  const CreateItinararyRequest({
    this.name,
  });

  factory CreateItinararyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateItinararyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateItinararyRequestToJson(this);
}
