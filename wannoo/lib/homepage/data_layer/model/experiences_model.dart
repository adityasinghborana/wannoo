class ExperiencesModel {
  final int id;
  final int internaTourid;
  final String title;
  final String imagepath;
  final String location;
  final String category;
  final String? country;
  final String? continent;
  final double? price;

  ExperiencesModel(
      {required this.title,
      required this.internaTourid,
      required this.imagepath,
      required this.location,
      required this.id,
      required this.category,
      required this.price,
      this.country,
      this.continent});

  get city => null;
}
