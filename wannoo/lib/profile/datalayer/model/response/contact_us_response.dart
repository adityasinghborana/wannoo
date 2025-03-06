import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response.g.dart';

@JsonSerializable()
class ContactUsResponse {
  final int? id;
  final String? Address;
  final String? mobilenumber;
  final String? Email;

  const ContactUsResponse({
    this.id,
    this.Address,
    this.mobilenumber,
    this.Email,
  });

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsResponseToJson(this);
}
