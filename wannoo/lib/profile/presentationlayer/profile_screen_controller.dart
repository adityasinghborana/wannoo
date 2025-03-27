import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wannoo/components/snackbar.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/profile/presentationlayer/items.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/auth_class.dart';

class ProfileScreenController extends GetxController {
  @override
  void onInit() {
    setEmailAndName();
    super.onInit();
  }

  final HomePageController homePageController = Get.find();
  final picker = ImagePicker();
  final Rx<File?> imageFile = Rx<File?>(null);

  var email = "".obs;
  var name = "".obs;

  List<Item> items = [
    Item(
        title: "EditProfile",
        icon: SvgPicture.asset(CustomIcons.edit),
        onpressed: () {
          Get.toNamed(AppRoutes.editProfile);
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
                      child: const Column(
                        children: [
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
                      child: const Column(
                        children: [
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
      aspectRatio: Platform.isAndroid
          ? const CropAspectRatio(ratioX: 1, ratioY: 1)
          : null,
      uiSettings: [
        AndroidUiSettings(
          hideBottomControls: false,
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
      uploadImage(File(croppedFile.path));
    }
  }

  Future<void> uploadImage(File imageFile) async {
    final dio.Dio client = dio.Dio();

    try {
      String fileName = imageFile.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        "image": await dio.MultipartFile.fromFile(imageFile.path,
            filename: fileName),
      });

      dio.Response response = await client.post(
        "$baseurl/upload",
        data: formData,
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      print(response.data);
      var uid = await getUserUID();
      updateProfileImage(uid, response.data["path"]);
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  updateProfileImage(String? uid, String profileImageUrl) async {
    final dio.Dio client = dio.Dio();

    try {
      dio.Response response = await client.patch(
        "$baseurl/updateimage",
        data: {"uid": uid, "profileImageUrl": profileImageUrl},
        options: dio.Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        openIconSnackBar(
            Get.context, "Image Uploaded", const Icon(Icons.check));
        homePageController.currentImage.value = response.data["profileImage"];
      }
      print("Response: ${response.data}");
    } catch (e) {
      print("Error updating profile image: $e");
    }
  }

  void setEmailAndName() {
    email.value = homePageController.email.value;
    name.value = homePageController.name.value;
  }
}
