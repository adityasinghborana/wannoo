import 'package:json_annotation/json_annotation.dart';

part 'legal_screen_request_model.g.dart';

@JsonSerializable()
class LegalScreenRequestModel {
  final int? id;
  final String? content;

  const LegalScreenRequestModel({
    this.id,
    this.content,
  });

  factory LegalScreenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LegalScreenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LegalScreenRequestModelToJson(this);
}
