import 'package:json_annotation/json_annotation.dart';

part 'booking_request.g.dart';

@JsonSerializable()
class BookingRequest {
  final String fullName;
  final String email;
  final String status;
  final int passengers;
  final String tourDate;
  final double serviceTotal;
  final String userId;
  final String roleId;
  final int tourId;

  const BookingRequest({
    required this.fullName,
    required this.email,
    required this.status,
    required this.passengers,
    required this.tourDate,
    required this.serviceTotal,
    required this.userId,
    required this.roleId,
    required this.tourId,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}
