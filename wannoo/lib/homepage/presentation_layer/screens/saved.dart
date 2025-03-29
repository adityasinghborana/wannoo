import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';

import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/itinarary/data_layer/model/request/favtourrequest.dart';
import 'package:wannoo/itinarary/data_layer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/data_layer/service/itinarary_remote.dart';
import 'package:wannoo/routes.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();
    final itineraryRepo = ItinararyRepoImpl(
      ItinararyRemote(Dio()),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Itineraries"),
      ),
      body: Obx(
        () => homePageController.itinararyList.isNotEmpty
            ? ListView.builder(
                itemCount: homePageController
                    .itinararyList.length, // Set the number of items you want
                itemBuilder: (BuildContext context, int index) {
                  final itinerary = homePageController.itinararyList[index];
                  final name = (itinerary.name ?? '').isEmpty
                      ? 'Unnamed itinerary'
                      : itinerary.name!;

                  return FutureBuilder(
                    future: itineraryRepo.getFavTours(
                      FavTourRequest(id: itinerary.id!),
                    ),
                    builder: (context, tours) => ListTile(
                      minTileHeight: 72,
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 56,
                        width: 56,
                        child: Builder(
                          builder: (context) {
                            if (!tours.hasData) {
                              return const SizedBox.shrink();
                            } else if (tours.data!.isEmpty) {
                              return Center(
                                child: Text(
                                  itinerary.name!.toUpperCase().substring(0, 1),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              );
                            } else if (tours.data!.length > 3) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            '$baseurl/${tours.data![0].imagePath!}',
                                            height: 28,
                                            width: 28,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Center(
                                              child: Text(
                                                itinerary.name!
                                                    .toUpperCase()
                                                    .substring(0, 1),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.network(
                                            '$baseurl/${tours.data![1].imagePath!}',
                                            height: 28,
                                            width: 28,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Center(
                                              child: Text(
                                                itinerary.name!
                                                    .toUpperCase()
                                                    .substring(0, 1),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            '$baseurl/${tours.data![2].imagePath!}',
                                            height: 28,
                                            width: 28,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Center(
                                              child: Text(
                                                itinerary.name!
                                                    .toUpperCase()
                                                    .substring(0, 1),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.network(
                                            '$baseurl/${tours.data![3].imagePath!}',
                                            height: 28,
                                            width: 28,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Center(
                                              child: Text(
                                                itinerary.name!
                                                    .toUpperCase()
                                                    .substring(0, 1),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (tours.data!.length > 1) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      '$baseurl/${tours.data!.first.imagePath!}',
                                      height: 56,
                                      width: 28,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Center(
                                        child: Text(
                                          itinerary.name!
                                              .toUpperCase()
                                              .substring(0, 1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.network(
                                      '$baseurl/${tours.data!.last.imagePath!}',
                                      height: 56,
                                      width: 28,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Center(
                                        child: Text(
                                          itinerary.name!
                                              .toUpperCase()
                                              .substring(0, 1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Image.network(
                              '$baseurl/${tours.data!.first.imagePath!}',
                              height: 56,
                              width: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                child: Text(
                                  itinerary.name!.toUpperCase().substring(0, 1),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      title: Text(name),
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.savedList,
                          parameters: {
                            "title":
                                homePageController.itinararyList[index].name ??
                                    "",
                            "id": homePageController.itinararyList[index].id
                                .toString(),
                          },
                        );
                      },
                    ),
                  );
                },
              )
            : Container(
                padding: const EdgeInsets.all(32),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.plane,
                      size: 56,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      'Create an itinerary and start planning your adventures',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openDialog() {
    final HomePageController homePageController = Get.find();
    return Get.dialog(
      Form(
        child: Builder(
          builder: (context) => AlertDialog(
            title: const Text("Enter Itinerary Name"),
            content: TextFormField(
              controller: homePageController.itinararyController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: 'Vacation trip',
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            actions: [
              TextButton(
                onPressed: Get.back,
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  if (!Form.of(context).validate()) return;
                  homePageController.postItinarary();
                  Get.back();
                  homePageController.itinararyController.clear();
                },
                child: const Text("Add Itinarary"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
