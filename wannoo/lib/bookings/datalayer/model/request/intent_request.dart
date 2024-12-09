import 'package:json_annotation/json_annotation.dart';
part 'intent_request.g.dart';

@JsonSerializable()
class IntentRequest {
  final String name;
  final String email;
  final double amount;

  const IntentRequest({
    required this.name,
    required this.email,
    required this.amount,
  });

  factory IntentRequest.fromJson(Map<String, dynamic> json) =>
      _$IntentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IntentRequestToJson(this);
}
