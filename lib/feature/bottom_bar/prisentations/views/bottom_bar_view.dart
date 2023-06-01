// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/controllers/bottom_bar_controller.dart';
import 'package:orderstage/feature/theme/presintations/controller/dynamic_theme_controller.dart';
import 'package:orderstage/feature/theme/presintations/view/widgets/dynamic_theme.dart';

class BottomBarView extends GetView<BottomBarController> {
  BottomBarView({Key? key}) : super(key: key);

  DynamicThemeController dynamicThemeController =
      Get.find<DynamicThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(<BottomBarController>() {
      return DynamicTheme(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: controller.selectedIndex.value,
            iconSize: 30,
            items: controller.items,
            onTap: controller.onItemTapped,
          ),
          body: controller.pages.elementAt(controller.selectedIndex.value),
          floatingActionButton: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '%',
                      style: TextStyle(
                        color: dynamicThemeController.secondaryColor.value,
                      ),
                    ),
                    Text(
                      AppStrings.offers,
                      style: TextStyle(
                        color: dynamicThemeController.secondaryColor.value,
                      ),
                    ),
                  ],
                ),
                onPressed: () {}),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
    });
  }
}
