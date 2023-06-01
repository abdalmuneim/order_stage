import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/font_manager.dart';

import '../../controller/dynamic_theme_controller.dart';

class DynamicTheme extends GetView<DynamicThemeController> {
  const DynamicTheme({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          primaryColor: controller.primaryColor.value,
          canvasColor: controller.navBarColor.value,
          scaffoldBackgroundColor: controller.scaffoldBackgroundColor.value,
          fontFamily: FontConstants.almarai,
          colorScheme: ColorScheme(
            primary: controller.primaryColor.value,
            secondary: controller.secondaryColor.value,
            background: Theme.of(context).colorScheme.background,
            brightness: Theme.of(context).colorScheme.brightness,
            error: Theme.of(context).colorScheme.error,
            onBackground: Theme.of(context).colorScheme.onBackground,
            onError: Theme.of(context).colorScheme.onError,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
            onSecondary: Theme.of(context).colorScheme.onSecondary,
            onSurface: Theme.of(context).colorScheme.onSurface,
            surface: Theme.of(context).colorScheme.surface,
          ),

          /// dropdownMenuTheme
          dropdownMenuTheme: const DropdownMenuThemeData(),

          /// FloatingActionButtonThemeData
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: controller.primaryColor.value,
            extendedTextStyle: TextStyle(
              fontSize: 12,
              color: controller.secondaryColor.value,
              fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
            ),
          ),
          drawerTheme: DrawerThemeData(
            backgroundColor: controller.drawerBackgroundColor.value,
          ),

          /// AppBarTheme
          appBarTheme: AppBarTheme(
            backgroundColor: controller.primaryColor.value,
            actionsIconTheme: IconThemeData(
              color: controller.secondaryColor.value,
            ),
            iconTheme: IconThemeData(
              color: controller.secondaryColor.value,
            ),
            titleTextStyle: TextStyle(
              color: controller.secondaryColor.value,
              fontFamily: FontConstants.almarai,
              fontSize: Theme.of(context).appBarTheme.titleTextStyle?.fontSize,
            ),
          ),

          /// bottomNavigationBarTheme
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(
              color: controller.selectedItemColor.value,
              fontFamily: FontConstants.almarai,
            ),
            unselectedLabelStyle: TextStyle(
              color: controller.unSelectedItemColor.value,
              fontFamily: FontConstants.almarai,
            ),
            selectedItemColor: controller.selectedItemColor.value,
            unselectedItemColor: controller.unSelectedItemColor.value,
            selectedIconTheme: IconThemeData(
              color: controller.selectedItemColor.value,
            ),
            unselectedIconTheme: IconThemeData(
              color: controller.unSelectedItemColor.value,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: controller.selectedItemColor.value,
          ),
          textTheme: Theme.of(context).textTheme.copyWith(
              labelMedium: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: controller.secondaryColor.value)),
        ),
        child: child,
      ),
    );
  }
}
