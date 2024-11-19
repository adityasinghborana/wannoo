import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingsController extends GetxController{
  final Uri url = Uri.parse("https://www.google.com"); // Replace with your URL

  void launchURL() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

}