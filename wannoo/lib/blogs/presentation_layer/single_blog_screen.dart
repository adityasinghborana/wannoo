import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../data_layer/model/response/all_blogs_model.dart';

class BlogDetailScreen extends StatelessWidget {
  final AllBlogsModel blog; // Replace `Blog` with your actual model class

  const BlogDetailScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Details", style: CustomTextStyles.fontL2SemiBold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "blog-${blog.id}", // Same tag as in BlogsScreen
            child: Image.network(
              "$baseurl/${blog.imagePath!}", // Display blog image
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              blog.title!,
              style: CustomTextStyles.fontL2SemiBold.copyWith(fontSize: 20),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: HtmlWidget(
                onTapUrl: (url) async {
                  debugPrint("Clicked URL: $url");
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.externalApplication);
                  } else {
                    debugPrint("Could not launch $url");
                  }
                  return true;
                },
                blog.content!,
                textStyle: CustomTextStyles.fontL1Medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
