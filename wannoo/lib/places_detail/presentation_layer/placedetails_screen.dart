import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/places_detail/data_layer/repository/placeDetailsrepo.dart';
import 'package:wannoo/places_detail/data_layer/service/remote.dart';
import 'package:wannoo/places_detail/data_layer/usecase/getplacesdetailsusecase.dart';
import 'package:wannoo/places_detail/presentation_layer/placedetails_controller.dart';
import 'package:wannoo/places_detail/presentation_layer/widgets/floating_button.dart';
import 'package:wannoo/places_detail/presentation_layer/widgets/main_details.dart';
import 'package:wannoo/places_detail/presentation_layer/widgets/faq_section.dart';

import '../../components/experiences_list_view.dart';
import '../../homepage/presentation_layer/widgets/heading_with_button.dart';
import '../../routes.dart';
import 'widgets/Expansion_listtile.dart';

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
    final String? id = Get.parameters['id'];
    final String? amount = Get.parameters['amount'];

    placedetailsController.getPlaceData(id ?? "");

    return Scaffold(
      backgroundColor: ThemeColor.colorBgPrimary,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                expandedHeight: 180,
                centerTitle: true,
                title: Text(placedetailsController.demoData.value.title),
                flexibleSpace: FlexibleSpaceBar(
                  background: Obx(
                    () {
                      return AuraUICarousel(
                        images:
                            placedetailsController.imagePaths.value.map((img) {
                          return '$baseurl/${img.imagepath}'; // Concatenating baseurl and imagepath
                        }).toList(),
                        pageController: pageController,
                        showButtons: false,
                        maxWidth: Get.width,
                        height: 180,
                        padding: EdgeInsets.zero,
                      );
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
                        Title: 'About Us',
                        Description:
                            placedetailsController.demoData.value.description,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Facilities',
                        Description:
                            placedetailsController.demoData.value.facilities,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Example Itinerary',
                        Description: placedetailsController
                            .demoData.value.exampleItinerary,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Cultural and Nearby Events',
                        Description: placedetailsController
                            .demoData.value.culturalAndNearbyEvents,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Safety and Etiquette',
                        Description:
                            placedetailsController.demoData.value.safety,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Entry Info & pricing',
                        Description:
                            placedetailsController.demoData.value.entryInfo,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Accomodation & Facilities',
                        Description:
                            placedetailsController.demoData.value.accommodation,
                      );
                    }),
                    Obx(() {
                      return DetailsExapansionTile(
                        isExpanded: false,
                        Title: 'Budget',
                        Description:
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
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.bookmark),
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () {
                          debugPrint(
                              "${placedetailsController.demoData.value.bookable}");
                          if (placedetailsController.demoData.value.bookable ==
                              true) {
                            Get.toNamed(AppRoutes.externalSite, arguments: {
                              "price":
                                  placedetailsController.demoData.value.price,
                            });
                          } else {
                            Get.toNamed(AppRoutes.booking, arguments: {
                              "tourid":
                                  placedetailsController.demoData.value.tourId,
                              "price":
                                  placedetailsController.demoData.value.price,
                            });
                          }
                        },
                        child: const Text('Book Now'),
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
