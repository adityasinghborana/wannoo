import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/places_detail/datalayer/repository/placeDetailsrepo.dart';
import 'package:wannoo/places_detail/datalayer/service/remote.dart';
import 'package:wannoo/places_detail/datalayer/usecase/getplacesdetailsusecase.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_controller.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_controller.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_controller.dart';
import 'package:wannoo/places_detail/presentationlayer/widgets/Faq.dart';
import 'package:wannoo/places_detail/presentationlayer/widgets/Floating%20Button.dart';
import 'package:wannoo/places_detail/presentationlayer/widgets/MainDetails.dart';
import 'package:wannoo/places_detail/presentationlayer/widgets/faq_section.dart';

import '../../Components/Appbar.dart';
import '../../Components/Experiences_listview.dart';
import '../../homepage/presentationlayer/widgets/Heading_with_button.dart';
import '../../routes.dart';
import '../../styles.dart';
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

  @override
  Widget build(BuildContext context) {
    final String? id = Get.parameters['id'];
    placedetailsController.getPlaceData(id ?? "");


    return Scaffold(
      backgroundColor: themeColor.colorBgPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Obx(() {
                  return AuraUICarousel(
                    images: placedetailsController.imagePaths.value.map((img) {
                      return '${baseurl}/${img
                          .imagepath}'; // Concatenating baseurl and imagepath
                    }).toList(),
                    pageController: pageController,
                    showButtons: false,
                    maxWidth: Get.width,
                    height: 250,
                    padding: EdgeInsets.zero,
                  );
                }),
                AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: const Text("Place Details"),
                ),
              ],
            ),
            Obx(() {
              return MainDetails(
                tourname: placedetailsController.demoData.value.title,
                Country: placedetailsController.demoData.value.country,
                rating: placedetailsController.demoData.value.rating ?? 4.2,
                reviews: placedetailsController.demoData.value.reviews,price: placedetailsController.demoData.value.price ,);
            }),
            Obx(() {
              return DetailsExapansionTile(
                isExpanded: true,
                Title: 'About Us',
                Description: placedetailsController.demoData.value.description,
              );
            }),
            Obx(() {
              return DetailsExapansionTile(
                isExpanded: false,
                Title: 'Facilities',
                Description: placedetailsController.demoData.value.facilities,
              );
            }),
            Obx(() {
              return DetailsExapansionTile(
                isExpanded: false,
                Title: 'Example Itinerary',
                Description:
                placedetailsController.demoData.value.exampleItinerary,
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
                Description: placedetailsController.demoData.value.safety,
              );
            }),
            Obx(() {
              return DetailsExapansionTile(
                isExpanded: false,
                Title: 'Entry Info & pricing',
                Description: placedetailsController.demoData.value.entryInfo,
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
                Description: placedetailsController.demoData.value.budget,
              );
            }),
            Obx(() {
              return FaqSection(placedetailsController.demoData.value.faq);
            }),
            HeadingwithButton(
              label: 'Recommended Tours',
            ),
            ExperiencesListview(),
            Gap(100)
          ],
        ),
      ),
      floatingActionButton: FloatingButton(onpressed: (){
        if(placedetailsController.demoData.value.bookable == true){
          Get.toNamed(AppRoutes.booking);
        }
        else{
          Get.toNamed(AppRoutes.ExternalSite);
        }
      },),
    );
  }
}
