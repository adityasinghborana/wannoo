import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/itinarary/data_layer/repository/itinarary_repository.dart';
import 'package:wannoo/itinarary/data_layer/service/itinarary_remote.dart';
import 'package:wannoo/itinarary/data_layer/usecase/getfavtour_usecase.dart';
import 'package:wannoo/itinarary/presentation_layer/itinarary_controller.dart';
import 'package:wannoo/routes.dart';

import '../data_layer/usecase/delete_fav_tour.dart';

class ItinararyScreen extends StatelessWidget {
  final title = Get.parameters["title"] ?? '';
  final itinararyId = Get.parameters["id"] ?? '';

  ItinararyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItinararyController itinararyController = Get.put(
      ItinararyController(
        getFavToursUseCase: GetFavToursUseCase(
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
          ),
        ),
        deleteFavTourUseCase: DeleteFavTourUseCase(
          ItinararyRepoImpl(
            ItinararyRemote(Dio()),
          ),
        ),
      ),
    );

    itinararyController.itinaryid.value = itinararyId;
    var items = itinararyController.savedTours;
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              flexibleSpace: FlexibleSpaceBar(
                background: items.isNotEmpty
                    ? Stack(
                        children: [
                          SizedBox.expand(
                            child: Image.network(
                              items.first.imagepath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLowest
                                .withValues(alpha: .7),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                title: Text(title),
                centerTitle: true,
              ),
              actions: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.trashCan),
                  onPressed: () {},
                )
              ],
            ),
            if (items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
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
                        'Add some tours to your itinerary',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.only(top: 16),
                sliver: SliverList.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => Get.toNamed(
                          AppRoutes.placedetails,
                          parameters: {
                            'id': "${items[index].id}",
                            'amount': items[index].price.toString(),
                          },
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 56,
                              width: 56,
                              child: Image.network(
                                item.imagepath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Row(
                                      spacing: 4,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.locationDot,
                                          size: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.fontSize,
                                        ),
                                        Text(
                                          item.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.trashCan,
                                size: 16,
                              ),
                              onPressed: () =>
                                  itinararyController.deleteFavTour(
                                tourId: item.id,
                                itinararyId: int.parse(itinararyId),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
