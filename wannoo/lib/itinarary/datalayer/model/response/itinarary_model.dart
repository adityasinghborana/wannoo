import 'package:json_annotation/json_annotation.dart';

part 'itinarary_model.g.dart';

@JsonSerializable()
class ItinararyModel {
  final int? id;
  final int? userId;
  final String? name;

  const ItinararyModel({
    this.id,
    this.userId,
    this.name,
  });

  factory ItinararyModel.fromJson(Map<String, dynamic> json) =>
      _$ItinararyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItinararyModelToJson(this);
}
