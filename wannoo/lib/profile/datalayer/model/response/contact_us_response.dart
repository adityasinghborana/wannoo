import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response.g.dart';

@JsonSerializable()
class ContactUsResponse {
  final int? id;
  final String? address;
  final String? mobilenumber;
  final String? email;

  const ContactUsResponse({
    this.id,
    this.address,
    this.mobilenumber,
    this.email,
  });

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsResponseToJson(this);
}
