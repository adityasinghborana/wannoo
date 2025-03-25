import 'package:json_annotation/json_annotation.dart';

part 'delete_itinarary_response.g.dart';

@JsonSerializable()
class DeleteItinararyResponse {
  final int? id;
  final int? userId;
  final String? name;

  const DeleteItinararyResponse({
    this.id,
    this.userId,
    this.name,
  });

  factory DeleteItinararyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteItinararyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItinararyResponseToJson(this);
}
