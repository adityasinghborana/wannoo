import 'package:json_annotation/json_annotation.dart';

part 'legal_screen_response_model.g.dart';

@JsonSerializable()
class LegalScreenResponseModel {
  final Result? result;

  const LegalScreenResponseModel({
    this.result,
  });

  factory LegalScreenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LegalScreenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LegalScreenResponseModelToJson(this);
}

@JsonSerializable()
class Result {
  final int? id;
  final String? content;

  const Result({
    this.id,
    this.content,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
