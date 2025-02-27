class ExperiencesModel {
  final int id;
  final int internaTourid;
  final String title;
  final String imagepath;
  final String location;
  final String Category;
  final String? Country;
  final String? Continent;
  final double? price;

  ExperiencesModel(
      {required this.title,
      required this.internaTourid,
      required this.imagepath,
      required this.location,
      required this.id,
      required this.Category,
      required this.price,
      this.Country,
      this.Continent});

  get city => null;
}
