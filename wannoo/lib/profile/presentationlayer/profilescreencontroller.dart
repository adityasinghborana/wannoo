import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_controller.dart';
import 'package:wannoo/profile/presentationlayer/items.dart';
import 'package:wannoo/routes.dart';

class ProfileScreenController extends GetxController {
  final HomePageController homePageController = Get.find();
  final picker = ImagePicker();
  final Rx<File?> imageFile = Rx<File?>(null);

  List<Item> items = [
    Item(
        title: "EditProfile",
        icon: SvgPicture.asset(CustomIcons.edit),
        onpressed: () {
          Get.toNamed(AppRoutes.editProfile);
        }),
    Item(
        title: "Track My Bookings ",
        icon: SvgPicture.asset(
          CustomIcons.track,
        ),
        onpressed: () {
          return null;
        }),
    Item(
        title: "My Itenanry",
        icon: SvgPicture.asset(
          CustomIcons.history,
        ),
        onpressed: () {
          return null;
        }),
    Item(
        title: "Help Center",
        icon: SvgPicture.asset(CustomIcons.help),
        onpressed: () {
          Get.toNamed(AppRoutes.helpScreen);
        }),
    Item(
        title: "Legal Info",
        icon: SvgPicture.asset(CustomIcons.legal),
        onpressed: () {
          Get.toNamed(AppRoutes.legalScreen);
        }),
  ];

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SafeArea(
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: const [
                          Icon(Icons.image, size: 60.0),
                          SizedBox(height: 12.0),
                          Text("Gallery",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: const [
                          Icon(Icons.camera_alt, size: 60.0),
                          SizedBox(height: 12.0),
                          Text("Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to pick an image from the gallery
  Future<void> _imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  // Method to pick an image from the camera
  Future<void> _imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  // Method to crop the selected image
  Future<void> _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatio:
          Platform.isAndroid ? CropAspectRatio(ratioX: 1, ratioY: 1) : null,
      uiSettings: [
        AndroidUiSettings(
          hideBottomControls: true,
          toolbarTitle: "Image Cropper",
          toolbarColor: Colors.yellow,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: "Image Cropper",
        ),
      ],
    );
    if (croppedFile != null) {
      imageFile.value = File(croppedFile.path);
      homePageController.updateImage(imageFile.value);
    }
  }
}
