import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/places_detail/data_layer/repository/place_details_repository.dart';
import 'package:wannoo/places_detail/data_layer/service/remote.dart';
import 'package:wannoo/places_detail/data_layer/usecase/get_places_details_usecase.dart';
import 'package:wannoo/places_detail/presentation_layer/place_details_controller.dart';
import 'package:wannoo/places_detail/presentation_layer/widgets/main_details.dart';
import 'package:wannoo/places_detail/presentation_layer/widgets/faq_section.dart';
import 'package:wannoo/utilities/dialog.dart';
import 'package:wannoo/utilities/extension.dart';

import '../../components/experiences_list_view.dart';
import '../../homepage/presentation_layer/widgets/heading_with_button.dart';
import '../../routes.dart';
import 'widgets/expansion_list_tile.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final PageController pageController = PageController();

  final PlacedetailsController placedetailsController = Get.put(
    PlacedetailsController(
      getPlaceDetailsUseCase: GetPlaceDetailsUseCase(
        PlaceDetailsRepositoryImpl(
          GetPlacesDetails(Dio()),
        ),
      ),
    ),
  );

  PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    final tourStaticDataId = Get.parameters['tourStaticDataId'];
    final amount = Get.parameters['amount'];

    placedetailsController.getPlaceData(id ?? "");

    return Scaffold(
      backgroundColor: ThemeColor.colorBgPrimary,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                expandedHeight: 240,
                centerTitle: true,
                title: Obx(
                  () => Text(placedetailsController.demoData.value.title),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Obx(
                    () {
                      return AuraUICarousel(
                        images: placedetailsController.imagePaths.map((img) {
                          return '$baseurl/${img.imagepath}'; // Concatenating baseurl and imagepath
                        }).toList(),
                        pageController: pageController,
                        showButtons: false,
                        maxWidth: Get.width,
                        height: 240,
                        padding: EdgeInsets.zero,
                      ).fadeIn(duration: Durations.medium1);
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 132),
                sliver: SliverList.list(
                  children: [
                    Obx(() {
                      return MainDetails(
                        tourname: placedetailsController.demoData.value.title,
                        country: placedetailsController.demoData.value.country,
                        rating:
                            placedetailsController.demoData.value.rating ?? 4.2,
                        reviews: placedetailsController.demoData.value.reviews,
                        price: double.parse(amount ?? ""),
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: true,
                        title: 'About Us',
                        description:
                            placedetailsController.demoData.value.description,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Facilities',
                        description:
                            placedetailsController.demoData.value.facilities,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Example Itinerary',
                        description: placedetailsController
                            .demoData.value.exampleItinerary,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Cultural and Nearby Events',
                        description: placedetailsController
                            .demoData.value.culturalAndNearbyEvents,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Safety and Etiquette',
                        description:
                            placedetailsController.demoData.value.safety,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Entry Info & pricing',
                        description:
                            placedetailsController.demoData.value.entryInfo,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Accomodation & Facilities',
                        description:
                            placedetailsController.demoData.value.accommodation,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        title: 'Budget',
                        description:
                            placedetailsController.demoData.value.budget,
                      );
                    }),
                    Obx(() {
                      return FaqSection(
                          placedetailsController.demoData.value.faq);
                    }),
                    const HeadingwithButton(
                      label: 'Recommended Tours',
                    ),
                    ExperiencesListview(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              child: Card(
                elevation: 8.0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 16,
                    children: [
                      IconButton(
                        onPressed: () => showMyModalBottomSheet(
                          context,
                          int.parse(tourStaticDataId!),
                        ),
                        icon: const FaIcon(FontAwesomeIcons.heart),
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            debugPrint(
                                "${placedetailsController.demoData.value.bookable}");
                            if (placedetailsController
                                    .demoData.value.bookable ==
                                true) {
                              Get.toNamed(AppRoutes.externalSite, arguments: {
                                "price":
                                    placedetailsController.demoData.value.price,
                              });
                            } else {
                              Get.toNamed(AppRoutes.booking, arguments: {
                                "tourid": placedetailsController
                                    .demoData.value.tourId,
                                "price":
                                    placedetailsController.demoData.value.price,
                              });
                            }
                          },
                          child: const Text('Book Now'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
