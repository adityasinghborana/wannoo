// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntentRequest _$IntentRequestFromJson(Map<String, dynamic> json) =>
    IntentRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$IntentRequestToJson(IntentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'amount': instance.amount,
    };
