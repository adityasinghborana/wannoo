class ExperiencesModel{
  final int id ;
  final String title;
  final String imagepath;
  final String location;
  final String Category;
  final String? Country;
  final String? Continent;

  ExperiencesModel({required this.title, required this.imagepath,required this.location ,required this.id,required this.Category ,this.Country,this.Continent});

  get city => null;
}