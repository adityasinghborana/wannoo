import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/category_places/presentation_layer/filters_controller.dart';
import '../../Components/filter_slider.dart';
import '../../Constants.dart';
import '../../search/data_layer/model/request/city_request.dart';
import '../../search/data_layer/model/request/countryrequest.dart';
import '../../search/presentation_layer/widgets/drop_down.dart';
import 'category_places_controller.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final FiltersController filtersController = Get.find();
    final CategoryPlacesController categoryPlacesController = Get.find();
    return ListView(
      children: [
        ListTile(
          dense: true,
          title: const Text("Continent"),
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
        ),
        ListTile(
          title: CustomDropDownRow(
            icon: const Icon(Icons.place),
            dropdownlist: filtersController.continentList,
            onchanged: (value) {
              filtersController.selectedContinent.value = value;
              filtersController.getCountries(CountriesRequest(name: value));
              // Call the API related to continent selection here
            },
          ),
        ),
        ListTile(
          dense: true,
          title: const Text("Country"),
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
        ),
        ListTile(
          title: CustomDropDownRow(
            icon: const Icon(Icons.place),
            dropdownlist: filtersController.countryList,
            onchanged: (value) {
              filtersController.selectedCountry.value = value;
              filtersController.getCities(CityRequest(countryName: value));
              // Call the API related to continent selection here
            },
          ),
        ),
        ListTile(
          dense: true,
          title: const Text("City"),
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
        ),
        ListTile(
          title: CustomDropDownRow(
            icon: const Icon(Icons.place),
            dropdownlist: filtersController.cityList,
            onchanged: (value) {
              filtersController.selectedCity.value = value;
            },
          ),
        ),
        ListTile(
          dense: true,
          title: const Text("Budget"),
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
        ),
        ListTile(title: Obx(() {
          return FilterSlider(
            min: categoryPlacesController.minBudget.value.floor(),
            max: categoryPlacesController.maxBudget.value.floor(),
          );
        })),
        const SizedBox(height: 16),
        ListTile(
          title: FilledButton(
            onPressed: () {
              Navigator.pop(context);
              categoryPlacesController.getFilteredList();
            },
            child: const Text('Search'),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Navigator.pop(context);
              categoryPlacesController.getlist();
            },
            child: const Text('clear'),
          ),
        ),
      ],
    );
  }
}

class CustomRow extends StatelessWidget {
  final String name;

  const CustomRow({
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

  const CustomDropDownRow(
      {Key? key,
      required this.dropdownlist,
      required this.onchanged,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize with a placeholder value

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [globalShadow],
          color: ThemeColor.colorWhite,
          borderRadius: BorderRadius.circular(GlobalRadius.borderRadiusMedium)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // Aligns items to the start of the row
          children: [
            icon,
            const SizedBox(
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
