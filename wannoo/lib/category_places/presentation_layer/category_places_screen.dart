import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/category_places/presentation_layer/category_places_controller.dart';
import 'package:wannoo/category_places/presentation_layer/filters_widget.dart';
import 'package:wannoo/components/empty_state.dart';
import 'package:wannoo/components/places_card.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/extension.dart';

class CategoryPlacesScreen extends StatefulWidget {
  const CategoryPlacesScreen({super.key});

  @override
  State<CategoryPlacesScreen> createState() => CategoryPlacesScreenState();
}

class CategoryPlacesScreenState extends State<CategoryPlacesScreen> {
  final _searchController = TextEditingController();
  final _category = Get.parameters["category"];
  var _searchText = "";

  @override
  void initState() {
    _searchController.addListener(
        () => setState(() => _searchText = _searchController.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryPlacesController = Get.put(CategoryPlacesController());
    return Obx(
      () {
        final filtered = categoryPlacesController.places.where((place) {
          return '${place.title}|${place.location}'
              .toLowerCase()
              .contains(_searchText.toLowerCase());
        }).toList();
        return Scaffold(
          endDrawer: const Drawer(
            child: FiltersWidget(),
          ),
          appBar: AppBar(
            title: Text(_category ?? ""),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: ListTile(
                title: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Theme.of(context).colorScheme.surface,
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                      Icons.filter_list), // 👈 change this to any icon you want
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
          body: filtered.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return PlacesCard(
                      price: item.price ?? 0,
                      id: item.internaTourid,
                      title: item.title,
                      image: item.imagepath,
                      location: item.location,
                      onTap: () {
                        Get.toNamed(AppRoutes.placedetails, parameters: {
                          'amount': categoryPlacesController.places[index].price
                              .toString(),
                          'id': "${categoryPlacesController.places[index].id}"
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                ).fadeIn(
                  duration: Durations.long1,
                )
              : SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No results found",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
