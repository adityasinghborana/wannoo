import 'package:json_annotation/json_annotation.dart';

part 'intent_response.g.dart';

@JsonSerializable()
class IntentResponse {
  String clientSecret;

  IntentResponse({required this.clientSecret});

  factory IntentResponse.fromJson(Map<String, dynamic> json) =>
      _$IntentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IntentResponseToJson(this);
}
