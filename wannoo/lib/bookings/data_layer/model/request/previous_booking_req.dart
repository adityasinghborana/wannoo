import 'package:json_annotation/json_annotation.dart';

part 'previous_booking_req.g.dart';

@JsonSerializable()
class PreviousBookingReq {
  final String id;
  PreviousBookingReq({required this.id});

  factory PreviousBookingReq.fromJson(Map<String, dynamic> json) =>
      _$PreviousBookingReqFromJson(json);
  Map<String, dynamic> toJson() => _$PreviousBookingReqToJson(this);
}
