import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/routes.dart';

import '../../../components/text_field.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.find();
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
                  return ListTile(
                    title: Text(name),
                    trailing: IconButton(
                      onPressed: () {
                        homePageController.deleteItinarary(itinerary.id ?? 0);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.savedList, parameters: {
                        "title":
                            homePageController.itinararyList[index].name ?? "",
                        "id": homePageController.itinararyList[index].id
                            .toString(),
                      });
                    },
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
                    const FaIcon(
                      FontAwesomeIcons.plane,
                      size: 56,
                    ),
                    Text(
                      'Create an itinerary and start planning your adventure',
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
