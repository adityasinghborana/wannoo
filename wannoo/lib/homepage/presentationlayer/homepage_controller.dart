import 'dart:io';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/categories/datalayer/usecase/allcategoriesusecase.dart';
import 'package:wannoo/homepage/datalayer/model/category_model.dart';
import 'package:wannoo/homepage/datalayer/model/experiences_model.dart';
import 'package:wannoo/homepage/datalayer/model/services_model.dart';
import 'package:wannoo/homepage/datalayer/usecase/getalltoursUsecase.dart';
import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/datalayer/model/response/itinarary_model.dart';
import 'package:wannoo/itinarary/datalayer/usecase/create_itinarary_usecase.dart';
import 'package:wannoo/itinarary/datalayer/usecase/post_fav_tour.dart';
import 'package:wannoo/utilities/dialog.dart';
import '../../categories/presentationlayer/categorycontroller.dart';
import '../../itinarary/datalayer/usecase/get_itinarary_usecase.dart';

class HomePageController extends GetxController {
  final GetAllToursUseCase getAllToursUseCase;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetitinararyUseCase getitinararyUseCase;
  final CreateItinararyUseCase createItinararyUseCase;
  final CategoryController categoryController = Get.put(CategoryController());
  final PostFavUseCase postFavUseCase;

  var currentImage = Rx<File?>(null);

  HomePageController({
    required this.getAllToursUseCase,
    required this.postFavUseCase,
    required this.getitinararyUseCase,
    required this.getAllCategoriesUseCase,
    required this.createItinararyUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    getItinarary();
    getAllCategories();
    getAllTours();
  }

  final TextEditingController itinararyController = TextEditingController();
  final List<Widget> navigationItems = [
    Icon(
      FontAwesomeIcons.house,
      color: themeColor.colorBgSecondory,
    ),
    Icon(
      FontAwesomeIcons.plane,
      color: themeColor.colorBgSecondory,
    ),
    Icon(
      FontAwesomeIcons.blog,
      color: themeColor.colorBgSecondory,
    ),
    Icon(
      FontAwesomeIcons.ticket,
      color: themeColor.colorBgSecondory,
    ),
  ];
  final RxList<CategoryModel> category = <CategoryModel>[].obs;
  final RxList<ItinararyModel> itinararyList = <ItinararyModel>[].obs;

  final RxList<ExperiencesModel> experiences = <ExperiencesModel>[].obs;
  final List<ServicesModel> services = [
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),
    ServicesModel(title: 'trek', imagepath: image.Cat1),
  ];

  void getAllCategories() async {
    try {
      final response = await getAllCategoriesUseCase.execute();

      categoryController.category.assignAll(response.map(
          (e) => CategoryModel(title: e.cityTourType, imagepath: e.image)));

      category.assignAll(response.map(
          (e) => CategoryModel(title: e.cityTourType, imagepath: e.image)));
    } catch (e) {
      print(e);
    }
  }

  void getAllTours() async {
    try {
      // Execute the use case to fetch all tours
      final response = await getAllToursUseCase.execute();

      // Map the response to a list of ExperiencesModel objects
      experiences.value = response.map((tour) {
        return ExperiencesModel(
            id: tour.tourId ?? 0,
            title: tour.tourName ?? "No name",
            // Replace `title` with the actual property from `tour`
            imagepath: '${baseurl}/${tour.imagePath ?? ""}',
            // Adjust the path as per your model structure
            location: tour.cityName ?? "",
            Category: tour.cityTourType ?? "",
            // Replace `location` with the actual property
            Country: tour.countryName,
            Continent: tour.continent,
            internaTourid: tour.id ?? 0);
      }).toList();

      // Print the list of tours
      print(experiences);
    } catch (e) {
      // Handle any errors that occur during the API call
      print("An error occurred: $e");
    }
  }

  void updateImage(File? newImage) {
    currentImage.value = newImage;
  }

  void getItinarary() async {
    await getitinararyUseCase.execute().then((response) {
      print("response:${response}");
      itinararyList.assignAll(response);
    });
  }

  void postItinarary() async {
    try {
      String req = itinararyController.text.toString();
      print(req);
      await createItinararyUseCase
          .execute(CreateItinararyRequest(name: req))
          .then((response) {
        itinararyList.add(response);
      });
    } catch (e) {
      print(e);
    }
  }

  void postFavTours({required PostFavTourRequest data}) async {
    try {
      postFavUseCase.execute(PostFavTourRequest(
          itineraryId: data.itineraryId,
          tourId: data.tourId,
          userId: data.userId));
    } catch (e) {
      showSnackBar(Get.context!, e.toString());
    }
  }
}
