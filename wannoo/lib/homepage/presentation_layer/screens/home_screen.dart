import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/experiences_list_view.dart';
import 'package:wannoo/components/category_list_view.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/homepage/presentation_layer/widgets/banner.dart';
import 'package:wannoo/routes.dart';

import '../homepage_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  var _collapsed = false;
  final HomePageController homePageController = Get.find();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 40 && !_collapsed) {
        setState(() => _collapsed = true);
      } else if (_scrollController.offset <= 40 && _collapsed) {
        setState(() => _collapsed = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar.large(
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              StaticImage
                  .homeimage, // Ensure this points to your asset correctly
              fit: BoxFit.cover,
            ),
            expandedTitleScale: 1.0,
            title: TextField(
              decoration: InputDecoration(
                isDense: _collapsed,
                hintText: 'Search',
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              readOnly: true,
              onTap: () => Get.toNamed(AppRoutes.search),
            ),
            titlePadding: _collapsed
                ? const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 16,
                    right: 64,
                  )
                : const EdgeInsets.all(16),
          ),
          actions: [
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.grey, // Customize as needed
                  foregroundImage: NetworkImage(
                      "$baseurl/${homePageController.currentImage.value}"), // Default asset image
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Categories'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
            trailing: TextButton(
              onPressed: () {},
              child: const Text('See All'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomListCategory(),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Most Visited'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverToBoxAdapter(
          child: ExperiencesListview(
            filterProperty: 'Festivals',
            isFilteredList: false,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Recommended tours'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverToBoxAdapter(
          child: ExperiencesListview(
            filterProperty: 'Trek',
            isFilteredList: false,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          sliver: SliverToBoxAdapter(
            child: CTA(),
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Hiking'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverToBoxAdapter(
          child: ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Desert Safari'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverToBoxAdapter(
          child: ExperiencesListview(
            filterProperty: 'Hiking',
            isFilteredList: false,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            title: const Text('Top Events'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: ExperiencesListview(
              filterProperty: 'Hiking',
              isFilteredList: false,
            ),
          ),
        ),
      ],
    );
  }
}
