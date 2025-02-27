import 'package:json_annotation/json_annotation.dart';

part 'previous_bookings.g.dart';

@JsonSerializable()
class PreviousBookings {
  final int? id;
  final String? status;
  final String? fullName;
  final String? email;
  final int? passengers;
  final String? tourDate;
  final double? serviceTotal;
  final String? userId;
  final String? roleId;
  final int? tourId;
  final String? createdAt;
  final Tour? tour;

  const PreviousBookings(
      {this.id,
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
      this.tour});

  factory PreviousBookings.fromJson(Map<String, dynamic> json) =>
      _$PreviousBookingsFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousBookingsToJson(this);
}

@JsonSerializable()
class Tour {
  final String? cityName;
  final String? tourName;

  const Tour({
    this.cityName,
    this.tourName,
  });

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);

  Map<String, dynamic> toJson() => _$TourToJson(this);
}
