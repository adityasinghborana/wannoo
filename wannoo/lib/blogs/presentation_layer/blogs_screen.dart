import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wannoo/Blogs/presentation_layer/blogs_controller.dart';

import '../../Constants.dart';
import '../../blogs/presentation_layer/single_blog_screen.dart';
import '../../homepage/presentation_layer/widgets/saved_cards.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsController blogsController = Get.put(BlogsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Blogs"),
      ),
      body: Obx(
        () {
          if (blogsController.allBlogsList.isEmpty) {
            return const Center(child: Text("No blogs available"));
          }
          return CustomScrollView(
            slivers: [
              if (blogsController.allBlogsList.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Builder(
                      builder: (context) {
                        final item = blogsController.allBlogsList.first;
                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () =>
                              Get.to(() => BlogDetailScreen(blog: item)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    '$baseurl/${item.imagePath}',
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) =>
                                            Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest,
                                    ),
                                    errorBuilder:
                                        (context, child, loadingProgress) =>
                                            Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item.title ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              HtmlWidget(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                (item.content ?? '').substring(0, 50),
                              ),
                              Text(
                                DateFormat.yMMMMd()
                                    .format(DateTime.parse(item.createdAt!)),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              SliverList.list(children: const [
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                SizedBox(height: 16),
              ]),
              if (blogsController.allBlogsList.length > 1)
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 24),
                  sliver: SliverList.separated(
                    itemCount: blogsController.allBlogsList.length - 1,
                    itemBuilder: (context, index) {
                      var item = blogsController.allBlogsList[index + 1];
                      return SavedCards(
                        title: item.title!,
                        imagePath: item.imagePath ?? "",
                        date: item.createdAt!,
                        body: item.content!,
                        onTap: () {
                          // Navigate to the detail screen
                          Get.to(() => BlogDetailScreen(blog: item));
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
