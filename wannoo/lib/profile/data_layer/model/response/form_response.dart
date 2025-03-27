import 'package:json_annotation/json_annotation.dart';

part 'form_response.g.dart';

@JsonSerializable()
class FormResponse {
  final Result? result;

  const FormResponse({
    this.result,
  });

  factory FormResponse.fromJson(Map<String, dynamic> json) =>
      _$FormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FormResponseToJson(this);
}

@JsonSerializable()
class Result {
  final int? id;
  final String? name;
  final String? email;
  final String? message;

  const Result({
    this.id,
    this.name,
    this.email,
    this.message,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
