import 'package:json_annotation/json_annotation.dart';

part 'all_blogs_model.g.dart';

@JsonSerializable()
class AllBlogsModel {
  final int? id;
  final String? title;
  final String? content;
  final String? createdAt;

  const AllBlogsModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
  });

  factory AllBlogsModel.fromJson(Map<String, dynamic> json) =>
      _$AllBlogsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllBlogsModelToJson(this);
}
