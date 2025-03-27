import 'package:json_annotation/json_annotation.dart';

part 'places_details.g.dart';

@JsonSerializable()
class PlaceDetails {
  final int? id;
  final int? countryId;
  final String? countryName;
  final String? continent;
  final int? cityId;
  final String? cityName;
  final String? tourName;
  final String? duration;
  final String? imagePath;
  final String? cityTourTypeId;
  final String? cityTourType;
  final String? tourDescription;
  final String? tourInclusion;
  final String? tourShortDescription;
  final String? importantInformation;
  final String? itenararyDescription;
  final String? usefulInformation;
  final String? childAge;
  final String? infantAge;
  final int? infantCount;
  final bool? isSlot;
  final bool? Bookable;
  final bool? onlyChild;
  final String? startTime;
  final String? meal;
  final String? googleMapUrl;
  final String? tourExclusion;
  final int? TourId;
  final int? cutOffhrs;
  final String? vendorUid;
  final bool? isVendorTour;
  final List<TourImage>? tourImages;
  final List<TourOption>? tourOption;
  final List<Faq>? faq;

  PlaceDetails(
      {this.id,
      this.countryId,
      this.countryName,
      this.continent,
      this.cityId,
      this.cityName,
      this.Bookable,
      this.tourName,
      this.duration,
      this.imagePath,
      this.cityTourTypeId,
      this.cityTourType,
      this.tourDescription,
      this.tourInclusion,
      this.tourShortDescription,
      this.importantInformation,
      this.itenararyDescription,
      this.usefulInformation,
      this.childAge,
      this.infantAge,
      this.infantCount,
      this.isSlot,
      this.onlyChild,
      this.startTime,
      this.meal,
      this.googleMapUrl,
      this.tourExclusion,
      this.TourId,
      this.cutOffhrs,
      this.vendorUid,
      this.isVendorTour,
      this.tourImages,
      this.tourOption,
      this.faq});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDetailsToJson(this);
}

@JsonSerializable()
class TourImage {
  final int? id;
  final int? tourId;
  final String? imagePath;

  TourImage({
    this.id,
    this.tourId,
    this.imagePath,
  });

  factory TourImage.fromJson(Map<String, dynamic> json) =>
      _$TourImageFromJson(json);
  Map<String, dynamic> toJson() => _$TourImageToJson(this);
}

@JsonSerializable()
class TourOption {
  final int? id;
  final int? tourId;
  final String? optionName;
  final String? childAge;
  final String? infantAge;
  final String? optionDescription;
  final int? minPax;
  final int? maxPax;
  final bool? isWithoutTransfers;
  final bool? isSharingTransfer;
  final bool? isPrivateTransfer;
  final bool? isPrivateBoatWithoutTransfers;
  final bool? isPvtYachtWithoutTransfers;
  final int? tourOptionId;

  TourOption({
    this.id,
    this.tourId,
    this.optionName,
    this.childAge,
    this.infantAge,
    this.optionDescription,
    this.minPax,
    this.maxPax,
    this.isWithoutTransfers,
    this.isSharingTransfer,
    this.isPrivateTransfer,
    this.isPrivateBoatWithoutTransfers,
    this.isPvtYachtWithoutTransfers,
    this.tourOptionId,
  });
  factory TourOption.fromJson(Map<String, dynamic> json) =>
      _$TourOptionFromJson(json);
  Map<String, dynamic> toJson() => _$TourOptionToJson(this);
}

@JsonSerializable()
class Faq {
  final int id;
  final String question;
  final String answer;

  Faq(this.id, this.question, this.answer);

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
