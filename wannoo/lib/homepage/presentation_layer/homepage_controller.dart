import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wannoo/auth_module/datalayer/repo/userdeatils_repo.dart';
import 'package:wannoo/auth_module/datalayer/services/get_user_details.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/categories/datalayer/usecase/allcategoriesusecase.dart';
import 'package:wannoo/homepage/data_layer/model/category_model.dart';
import 'package:wannoo/homepage/data_layer/model/experiences_model.dart';
import 'package:wannoo/homepage/data_layer/model/services_model.dart';
import 'package:wannoo/homepage/data_layer/usecase/get_all_tours_usecase.dart';
import 'package:wannoo/itinarary/data_layer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/data_layer/model/request/user_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/response/itinarary_model.dart';
import 'package:wannoo/itinarary/data_layer/usecase/create_itinarary_usecase.dart';
import 'package:wannoo/itinarary/data_layer/usecase/post_fav_tour.dart';
import 'package:wannoo/utilities/auth_class.dart';
import 'package:wannoo/utilities/dialog.dart';
import '../../auth_module/datalayer/usecase/get_user_detail_usecase.dart';
import '../../components/snackbar.dart';
import '../../categories/presentation_layer/category_controller.dart';
import '../../itinarary/data_layer/usecase/delete_itinarary_usecase.dart';
import '../../itinarary/data_layer/usecase/get_itinarary_usecase.dart';

class HomePageController extends GetxController {
  final GetAllToursUseCase getAllToursUseCase;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetitinararyUseCase getitinararyUseCase;
  final CreateItinararyUseCase createItinararyUseCase;
  final CategoryController categoryController = Get.put(CategoryController());
  final PostFavUseCase postFavUseCase;
  final DeleteItinararyUseCase deleteItinararyUseCase;

  var currentImage = "".obs;
  var email = "".obs;
  var name = "".obs;

  HomePageController(
      {required this.getAllToursUseCase,
      required this.postFavUseCase,
      required this.getitinararyUseCase,
      required this.getAllCategoriesUseCase,
      required this.createItinararyUseCase,
      required this.deleteItinararyUseCase});

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
    getItinarary();
    getAllCategories();
    getAllTours();
  }

  GetUserDetailUseCase getUserDetailUseCase =
      GetUserDetailUseCase(UserDetailsRepoImpl(UserDetailsRemote(Dio())));
  final TextEditingController itinararyController = TextEditingController();
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
            imagepath: '$baseurl/${tour.imagePath ?? ""}',
            // Adjust the path as per your model structure
            location: tour.cityName ?? "",
            category: tour.cityTourType ?? "",
            // Replace `location` with the actual property
            country: tour.countryName,
            continent: tour.continent,
            price: tour.tourpricing?.amount?.toDouble(),
            internaTourid: tour.id ?? 0);
      }).toList();

      // Print the list of tours
      print(experiences);
    } catch (e) {
      // Handle any errors that occur during the API call
      print("An error occurred: $e");
    }
  }

  void getItinarary() async {
    var uid = await getUserUID();
    print("itinarary $uid");

    ///TODO add req in this function
    await getitinararyUseCase
        .execute(UserItinararyRequest(uid: uid.toString()))
        .then((response) {
      print("response:$response");
      itinararyList.assignAll(response);
    });
  }

  void postItinarary() async {
    try {
      String req = itinararyController.text.toString();
      var userUid = await getUserUID();
      print(req);
      await createItinararyUseCase
          .execute(CreateItinararyRequest(name: req, uid: userUid.toString()))
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

  void deleteItinarary(int id) async {
    await deleteItinararyUseCase
        .execute(DeleteItinararyRequest(id: id))
        .then((e) {
      openIconSnackBar(
          Get.context,
          "Itinarary Deleted",
          const Icon(
            Icons.check_circle_outline,
            color: ThemeColor.colorBgPrimary,
          ));
      getItinarary();
    });
  }

  void getUserDetails() async {
    var uid = await getUserUID();

    try {
      await getUserDetailUseCase.execute(uid ?? "").then((res) {
        currentImage.value = res.profileImage ?? "";
        email.value = res.email;
        name.value = res.username ?? "Not Set";
      });
    } catch (e) {
      print(e);
    }
  }
}
