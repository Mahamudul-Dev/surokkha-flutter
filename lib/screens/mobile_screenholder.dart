import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surokkha/controllers/mobile_screen_holder_controller.dart';

class MobieScreenHolder extends StatelessWidget {
  MobieScreenHolder({super.key});

  final MobileScreenHolderController controller =
      Get.put(MobileScreenHolderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.screens[controller.activeIndex.value]),
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar(
            icons: controller.bottomNavigationIcon,
            activeIndex: controller.activeIndex.value,
            onTap: (int index) => controller.activeIndex.value = index,
            backgroundColor: Colors.white,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ));
  }
}
