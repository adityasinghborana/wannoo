// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      address: json['address'] as String?,
      age: json['age'],
      dob: json['dob'],
      isUser: json['isUser'] as bool?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
      'isUser': instance.isUser,
      'uid': instance.uid,
      'username': instance.username,
    };
