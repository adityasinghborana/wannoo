import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:wannoo/auth_module/login_module/presentation/login_controller.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';
import 'package:wannoo/profile/presentationlayer/profile_screen_controller.dart';

import '../../components/large_button_2.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final HomePageController homePageController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 90, // You can adjust the radius as needed
                        foregroundColor: ThemeColor.colorBgSecondory,
                        backgroundColor: ThemeColor.colorBgSecondory,
                        backgroundImage: NetworkImage(
                            "$baseurl/${homePageController.currentImage.value}"),
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
              const Gap(30),
              Obx(
                () => Text(
                  profileScreenController.name.value,
                  style: CustomTextStyles.fontXlSemiBold,
                ),
              ),
              Obx(
                () => Text(profileScreenController.email.value,
                    style: CustomTextStyles.fontL1SemiBold
                        .copyWith(color: ThemeColor.colorTextSecondry)),
              )
            ],
          )),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(GlobalPadding.px_md),
              child: Column(
                children: List.generate(profileScreenController.items.length,
                    (int index) {
                  final item = profileScreenController.items[index];
                  return InkWell(
                    onTap: item.onpressed,
                    child: Card(
                      elevation: 3,
                      color: ThemeColor.colorWhite,
                      shadowColor: ThemeColor.colorBorder,
                      surfaceTintColor: ThemeColor.colorWhite,
                      child: ListTile(
                          leading: item.icon,
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          title: Text(item.title)),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LargeButton2(
                label: "Logout",
                height: 50,
                onPressed: () {
                  loginController.signOut(context: context);
                }),
          ),
        ]),
      ),
    );
  }
}
