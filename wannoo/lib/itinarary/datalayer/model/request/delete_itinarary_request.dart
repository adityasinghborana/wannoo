import 'package:json_annotation/json_annotation.dart';

part 'delete_itinarary_request.g.dart';

@JsonSerializable()
class DeleteItinararyRequest {
  final int? id;

  const DeleteItinararyRequest({
    this.id,
  });

  factory DeleteItinararyRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteItinararyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItinararyRequestToJson(this);
}
