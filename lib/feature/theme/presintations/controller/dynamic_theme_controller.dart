import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/feature/theme/domain/use_case/read_theme_use_case.dart';

class DynamicThemeController extends GetxController {
  final ReadThemeUseCase _readThemeUseCase;
  DynamicThemeController(this._readThemeUseCase);
  _getTheme() async {
    final result = await _readThemeUseCase();

    result.fold((l) {}, (r) {
      primaryColor.value = r.primaryColor!;
      secondaryColor.value = r.secondaryColor!;
      navBarColor.value = r.bottomBarColor!;
      scaffoldBackgroundColor.value = r.backgroundColor!;
      drawerBackgroundColor.value = r.drawerBackgroundColor!;
      unSelectedItemColor.value = r.unselectedItemColor!;
      selectedItemColor.value = r.selectedItemColor!;
      // appBarColor.value = r.headColor!;
      // textAppBarColor.value = r.headTitleColor!;
      // floatingButtonColor.value = r.floatingButtonColor!;
      // floatingButtonTextColor.value = r.floatingButtonTextColor!;
      // floatingButtonTextColor.value = r.floatingButtonTextColor!;
      // appBarActionColor.value = r.appBarActionColor!;
    });
    update();
  }

  @override
  void onReady() async {
    await _getTheme();
    super.onReady();
  }

  Rx<Color> primaryColor = Rx(MyColors.primary);
  Rx<Color> secondaryColor = Rx(MyColors.secondary);
  Rx<Color> scaffoldBackgroundColor = Rx(Colors.grey[200]!);
  Rx<Color> drawerBackgroundColor = Rx(MyColors.secondary);
  Rx<Color> navBarColor = Rx(MyColors.secondary);
  Rx<Color> unSelectedItemColor = Rx(MyColors.grey);
  Rx<Color> selectedItemColor = Rx(MyColors.primary);
  // Rx<Color> appBarColor = Rx(MyColors.primary);
  // Rx<Color> textAppBarColor = Rx(MyColors.secondary);
  // Rx<Color> floatingButtonColor = Rx(MyColors.primary);
  // Rx<Color> floatingButtonTextColor = Rx(MyColors.secondary);
  // Rx<Color> appBarActionColor = Rx(MyColors.primary);
}
