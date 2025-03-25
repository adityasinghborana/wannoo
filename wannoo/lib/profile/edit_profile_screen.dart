import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/AuthModule/LoginModule/presentation/login_controller.dart';
import 'package:wannoo/Components/confirmationdialog.dart';
import 'package:wannoo/Components/large_button_2.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/profile/edit_profile_controller.dart';

import '../Components/text_field.dart';
import '../Components/borderbutton.dart';

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
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: GlobalPadding.px_md, vertical: GlobalPadding.py_md),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                TextFieldCustom(
                  textController: editProfileController.nameController,
                  hintText: 'Full Name',
                ),
                const Gap(20),
                TextFieldCustom(
                  textController: editProfileController.addressController,
                  hintText: 'Address',
                ),
                const Gap(20),
                TextFieldCustom(
                  textController: editProfileController.phoneController,
                  hintText: 'Mobile Number',
                ),
                const Gap(20),
                LargeButton2(
                    label: "Save",
                    height: 50,
                    onPressed: () {
                      editProfileController.updateUserDetail();
                    })
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                                    color: ThemeColor.colorBgSecondory),
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
                                    color: ThemeColor.colorAccentSecondory),
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
