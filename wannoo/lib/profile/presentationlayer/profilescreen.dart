import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/profile/presentationlayer/profilescreencontroller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 90, // You can adjust the radius as needed
                        foregroundColor: themeColor.colorBgSecondory,
                        backgroundColor: themeColor.colorBgSecondory,
                        backgroundImage: profileScreenController
                                    .imageFile.value !=
                                null
                            ? FileImage(profileScreenController.imageFile.value!)
                                as ImageProvider
                            : AssetImage(
                                image.experiencesimages), // Placeholder image
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                          onTap: () async {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                              Permission.camera,
                            ].request();
                            if (statuses[Permission.storage]!.isGranted &&
                                statuses[Permission.camera]!.isGranted) {
                              profileScreenController.showImagePicker(context);
                            } else {
                              profileScreenController.showImagePicker(context);
                            }
                          },
                          child: SvgPicture.asset(CustomIcons.editpic)),
                    ),
                  ],
                ),
              ),
Gap(30),
              Text("Aditya Singh ",style: CustomTextStyles.fontXlSemiBold,),
              Text("aditya@ogresto.com",style: CustomTextStyles.fontL1SemiBold.copyWith(color: themeColor.colorTextSecondry))

            ],
          )),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(globalPadding.px_md),
              child: Column(
                children: List.generate(profileScreenController.items.length,
                    (int index) {
                  final item = profileScreenController.items[index];
                  return Card(
                    elevation: 3,
                    color: themeColor.colorWhite,
                    shadowColor: themeColor.colorBorder,
                    surfaceTintColor: themeColor.colorWhite,
                    child: ListTile(
                        leading: item.icon,
                        trailing: Icon(Icons.keyboard_arrow_right),
                        title: Text(item.title)),
                  );
                }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
