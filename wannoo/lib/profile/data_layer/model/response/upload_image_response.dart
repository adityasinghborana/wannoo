import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  final String message;
  final String originalname;
  final String path;

  UploadImageResponse({
    required this.message,
    required this.originalname,
    required this.path,
  });

  // Deserialize JSON to Model
  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  // Serialize Model to JSON
  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
}
