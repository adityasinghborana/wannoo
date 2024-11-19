// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_blogs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBlogsModel _$AllBlogsModelFromJson(Map<String, dynamic> json) =>
    AllBlogsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$AllBlogsModelToJson(AllBlogsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
