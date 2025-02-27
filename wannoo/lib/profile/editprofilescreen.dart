import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/AuthModule/LoginModule/presentation/login_controller.dart';
import 'package:wannoo/Components/confirmationdialog.dart';
import 'package:wannoo/Components/largeButton2.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/profile/editprofileController.dart';

import '../Components/Textfield.dart';
import '../Components/borderbutton.dart';
import '../Components/large_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final EditProfileController editProfileController =
        Get.put(EditProfileController());
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: globalPadding.px_md, vertical: globalPadding.py_md),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                TextFieldCustom(
                  textController: editProfileController.nameController,
                  hintText: 'Full Name',
                ),
                Gap(20),
                TextFieldCustom(
                  textController: editProfileController.addressController,
                  hintText: 'Address',
                ),
                Gap(20),
                TextFieldCustom(
                  textController: editProfileController.nameController,
                  hintText: 'Mobile Number',
                ),
                Gap(20),
                LargeButton2(label: "Save", height: 50, onPressed: () {})
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LargeButton2(
                    label: "Logout",
                    height: 50,
                    onPressed: () {
                      loginController.signOut(context: context);
                    }),
                Gap(20),
                InvertedButton(
                  text: 'Delete Account ',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          title: 'Confirmation',
                          description:
                              'This action will remove all of your data.',
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancel',
                                style: CustomTextStyles.fontMdMedium.copyWith(
                                    color: themeColor.colorBgSecondory),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform delete action here
                                loginController.deleteUser(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Delete',
                                style: CustomTextStyles.fontMdMedium.copyWith(
                                    color: themeColor.colorAccentSecondory),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
