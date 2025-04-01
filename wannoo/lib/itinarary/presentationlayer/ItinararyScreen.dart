import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/EmptyState.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/itinarary/datalayer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/datalayer/service/itinarary_remote.dart';
import 'package:wannoo/itinarary/datalayer/usecase/getfavtour_usecase.dart';
import 'package:wannoo/itinarary/presentationlayer/itinararyController.dart';
import 'package:wannoo/routes.dart';

import '../../Components/experiences_card.dart';
import '../datalayer/usecase/delete_fav_tour.dart';

class ItinararyScreen extends StatelessWidget {
  final String? title = Get.parameters["title"];
  final String? itinararyId = Get.parameters["id"];

  ItinararyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItinararyController itinararyController = Get.put(
      ItinararyController(
        getFavToursUseCase: GetFavToursUseCase(
          itinararyRepoImpl(
            itinararyRemote(Dio()),
          ),
        ),
        deleteFavTourUseCase: DeleteFavTourUseCase(
          itinararyRepoImpl(
            itinararyRemote(Dio()),
          ),
        ),
      ),
    );

    itinararyController.itinaryid.value = itinararyId ?? "";
    var items = itinararyController.savedTours;
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        centerTitle: true,
      ),
      body: Obx(
        () => items.isEmpty
            ? Center(child: dataNotFound(width: 300.00, height: 300.00))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itinararyController.savedTours.length,
                itemBuilder: (context, index) {
                  print(itinararyController.savedTours.length);
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.placedetails, parameters: {
                        'id': "${items[index].id}",
                        'amount': items[index].price.toString(),
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: globalPadding.px_sm,
                          vertical: globalPadding.py_xs),
                      height: 220,
                      width: Get.width,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: ExperiencesCard(
                              isPriceVisible: false,
                              isAddIcon: false,
                              selectedTourId: items[index].internaTourid,
                              isfav: true,
                              title: items[index].title,
                              imagePath: items[index].imagepath,
                              location: items[index].location,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: themeColor.colorAccentSecondory
                                      .withOpacity(0.5),
                                ),
                                margin:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: IconButton(
                                    color: themeColor.colorBgPrimary,
                                    onPressed: () {
                                      itinararyController.deleteFavTour(
                                          itinararyId:
                                              int.parse(itinararyId ?? ""),
                                          tourId: items[index].id);
                                    },
                                    icon: const Icon(Icons.delete_outline))),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
