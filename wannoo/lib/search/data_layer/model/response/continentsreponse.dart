

import 'package:json_annotation/json_annotation.dart';
part 'continentsreponse.g.dart';

@JsonSerializable()
class AllContinents {
  final int id ;
  final String name;
  final String? image;
  AllContinents({required this.id, this.image,required this.name});

  factory AllContinents.fromJson(Map<String, dynamic> json) =>
      _$AllContinentsFromJson(json);
  Map<String, dynamic> toJson() => _$AllContinentsToJson(this);
}
