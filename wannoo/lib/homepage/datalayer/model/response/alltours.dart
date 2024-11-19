import 'package:json_annotation/json_annotation.dart';
part 'alltours.g.dart';

@JsonSerializable()
class ALLTours {
  int? id;
  int? tourId;
  String? continent;
  int? countryId;
  String? countryName;
  int? cityId;
  String? cityName;
  String? tourName;
  String? duration;
  String? imagePath;
  String? cityTourTypeId;
  String? cityTourType;
  bool? alwaysavailable;
  String? startingdate;
  String? endingdate;
  bool? recommended;
  bool? isvisible;
  bool? isvisiblePopularTours;
  bool? isvisibleReccomendedTours;
  bool? isSlot;
  bool? isVendorTour;
  String? vendorUid;
  ALLTours(
      this.id,
      this.tourId,
      this.continent,
      this.countryId,
      this.countryName,
      this.cityId,
      this.cityName,
      this.tourName,
      this.duration,
      this.imagePath,
      this.cityTourTypeId,
      this.cityTourType,
      this.alwaysavailable,
      this.startingdate,
      this.endingdate,
      this.recommended,
      this.isvisible,
      this.isvisiblePopularTours,
      this.isvisibleReccomendedTours,
      this.isSlot,
      this.isVendorTour,
      this.vendorUid,
      );

  factory ALLTours.fromJson(Map<String, dynamic> json) =>
      _$ALLToursFromJson(json);
  Map<String, dynamic> toJson() => _$ALLToursToJson(this);
}
