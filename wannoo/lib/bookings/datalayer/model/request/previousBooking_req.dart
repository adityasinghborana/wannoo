import 'package:json_annotation/json_annotation.dart';

part 'previousBooking_req.g.dart';

@JsonSerializable()
class PreviousbookingReq {
  final String id;
  PreviousbookingReq({required this.id});

  factory PreviousbookingReq.fromJson(Map<String, dynamic> json) =>
      _$PreviousbookingReqFromJson(json);
  Map<String, dynamic> toJson() => _$PreviousbookingReqToJson(this);
}
