import 'package:json_annotation/json_annotation.dart';

part 'categoriesresponse.g.dart';
@JsonSerializable()
class Category {
  final int id;
  final String cityTourType;
  final String image;
  Category(

      this.id,
      this.image,
      this.cityTourType
      );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}


