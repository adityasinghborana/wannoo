import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final BuildContext context;

  const MobileHeader(
      {super.key, this.isBackButton = true, required this.context});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: isBackButton,
      leading: isBackButton
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            )
          : IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
      backgroundColor: ThemeColor.colorWhite.withValues(alpha: 0.5),
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                InkWell(
                  onTap: () {
                    Get.toNamed('/home');
                  },
                  child: Image.asset(
                    "../asset/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: height * .05,
                  ),
                ),
                Flexible(flex: 3, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
