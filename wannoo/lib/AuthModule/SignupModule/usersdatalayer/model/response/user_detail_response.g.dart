// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      username: json['username'] as String?,
      isUser: json['isUser'] as bool?,
      email: json['email'] as String,
      address: json['address'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'isUser': instance.isUser,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
      'profileImage': instance.profileImage,
    };
