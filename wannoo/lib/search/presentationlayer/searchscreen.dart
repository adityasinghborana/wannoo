import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/text_button.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/search/datalayer/model/request/city_request.dart';
import 'package:wannoo/search/datalayer/repository/repository.dart';
import 'package:wannoo/search/datalayer/service/continentremote.dart';
import 'package:wannoo/search/datalayer/usecase/Getcitiesusecase.dart';
import 'package:wannoo/search/datalayer/usecase/continentusecase.dart';
import 'package:wannoo/search/datalayer/usecase/getcountryusecase.dart';
import 'package:wannoo/search/presentationlayer/serachController.dart';
import 'package:wannoo/search/presentationlayer/widgets/DropDown.dart';
import 'package:wannoo/utilities/dialog.dart';

import '../../Components/large_button.dart';
import '../datalayer/model/request/countryrequest.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchPageController searchPageController = Get.put(
        SearchPageController(
            getCountriesUseCase: GetCountriesUseCase(
              ContinentRepoImpl(
                ContinentRemote(Dio()),
              ),
            ),
            getCitiesUsecase: GetCitiesUsecase(
              ContinentRepoImpl(
                ContinentRemote(Dio()),
              ),
            ),
            getAllContinentsUseCase: GetAllContinentsUseCase(
                ContinentRepoImpl(ContinentRemote(Dio())))));
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Places"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CustomRow(
              name: "Continent",
            ),
            SizedBox(height: Height.heightMd),
            CustomDropDownRow(
              icon: Icon(Icons.place),
              dropdownlist: searchPageController.continentList,
              onchanged: (value) {
                searchPageController.SelectedContinent.value = value;
                searchPageController
                    .getCountries(CountriesRequest(name: value));
                // Call the API related to continent selection here
              },
            ),
            SizedBox(height: Height.heightMd),
            CustomRow(
              name: "Country",
            ),
            SizedBox(height: Height.heightMd),
            CustomDropDownRow(
              icon: Icon(Icons.place),
              dropdownlist: searchPageController.countryList,
              onchanged: (value) {
                searchPageController.SelectedCountry.value = value;
                print(searchPageController.countryList.toList());

                searchPageController.getCities(CityRequest(countryName: value));
                // Call the API related to continent selection here
              },
            ),
            SizedBox(height: Height.heightMd),
            CustomRow(
              name: "City",
            ),
            SizedBox(height: Height.heightMd),
            CustomDropDownRow(
              icon: Icon(Icons.place),
              dropdownlist: searchPageController.cityList,
              onchanged: (value) {
                searchPageController.SelectedCity.value = value;
              },
            ),
            SizedBox(height: Height.heightMd),
            CustomRow(
              name: "Category",
            ),
            SizedBox(height: Height.heightMd),
            CustomDropDownRow(
              icon: Icon(Icons.category),
              dropdownlist: searchPageController.categoryList,
              onchanged: (value) {
                searchPageController.SelectedCategory.value = value;
                print("Continent selected: $value");
                // Call the API related to continent selection here
              },
            ),
            SizedBox(height: Height.heightxl),
            LargeButton(
              label: 'Search ',
              onPressed: () {
                if (searchPageController.SelectedCountry.isEmpty ||
                    searchPageController.SelectedContinent.isEmpty ||
                    searchPageController.SelectedCity.isEmpty ||
                    searchPageController.SelectedCategory.isEmpty) {
                  return showSnackBar(context, "Plaese Select all Option");
                }
                searchPageController.moveto();
              },
            )
          ]),
        ));
  }
}

class CustomRow extends StatelessWidget {
  final String name;

  CustomRow({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize with a placeholder value

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Aligns items to the start of the row
        children: [
          Text(
            name,
            style: CustomTextStyles.fontMdMedium,
          ),

          // Add some spacing between the Text and DropdownButton
        ]);
  }
}

class CustomDropDownRow extends StatelessWidget {
  final RxList<String> dropdownlist;
  final Icon icon;

  final ValueChanged<String> onchanged;

  CustomDropDownRow(
      {Key? key,
      required this.dropdownlist,
      required this.onchanged,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize with a placeholder value

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [globalShadow],
          color: themeColor.colorWhite,
          borderRadius: BorderRadius.circular(globalRadius.borderRadius_m)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // Aligns items to the start of the row
          children: [
            icon,
            SizedBox(
              width: Height.heightSm,
            ),
            Expanded(
              child: CustomDropDown(
                list: dropdownlist,
                onChanged: (String selectedValue) {
                  onchanged(selectedValue); // Define custom behavior here
                },
              ),
            ),
            // Add some spacing between the Text and DropdownButton
          ]),
    );
  }
}
