import 'package:json_annotation/json_annotation.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse {
  final int? id;
  final String? status;
  final String? fullName;
  final String? email;
  final int? passengers;
  final String? tourDate;
  final double? serviceTotal;
  final String? userId;
  final dynamic roleId;
  final int? tourId;
  final String? createdAt;

  const BookingResponse({
    this.id,
    this.status,
    this.fullName,
    this.email,
    this.passengers,
    this.tourDate,
    this.serviceTotal,
    this.userId,
    this.roleId,
    this.tourId,
    this.createdAt,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}
