

class Faq {
  final int id;
  final String question;
  final String answer;

  Faq({required this.id, required this.question, required this.answer});
}

class ImageModel{

  final String imagepath;
  ImageModel({required this.imagepath});
}

class PlacedetailsModel {
  final int id;
  final int reviews;
  final List<ImageModel> images;
  final double? rating;
  final double price;
  final String title;
  final String country;
  final String description;
  final String facilities;
  final String exampleItinerary;
  final String culturalAndNearbyEvents;
  final String safety;
  final String entryInfo;
  final String accommodation;
  final String budget;
  final bool? bookable;

  final List<Faq> faq;

  PlacedetailsModel({
    this.bookable,
    this.country = "None",
    this.id = 0,
    this.reviews = 150,
    this.images = const [],
    this.rating = 0.0,
    this.price = 0.0,
    this.title = '',
    this.description = '',
    this.facilities = '',
    this.exampleItinerary = '',
    this.culturalAndNearbyEvents = '',
    this.safety = '',
    this.entryInfo = '',
    this.accommodation = '',
    this.budget = '',
    this.faq = const [],

  });
}