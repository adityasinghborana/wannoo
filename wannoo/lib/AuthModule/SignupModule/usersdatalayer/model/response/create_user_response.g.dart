// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelResponse _$UserModelResponseFromJson(Map<String, dynamic> json) =>
    UserModelResponse(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      username: json['username'] as String?,
      isUser: json['isUser'] as bool,
      email: json['email'] as String,
      address: json['address'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$UserModelResponseToJson(UserModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'isUser': instance.isUser,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob?.toIso8601String(),
    };
