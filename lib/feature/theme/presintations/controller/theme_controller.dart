import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/choses_color.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/theme/domain/use_case/save_theme_use_case.dart';

class ThemeController extends GetxController {
  final SaveThemeUseCase _saveThemeUseCase;

  ThemeController(
    this._saveThemeUseCase,
  );

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get globalKey => _globalKey;

  /* Color _appBarActionColor = MyColors.secondary;
  Color get appBarActionColor => _appBarActionColor; */

  Color _drawerBackgroundColor = MyColors.secondary;
  Color get drawerBackgroundColor => _drawerBackgroundColor;

  Color _backgroundColor = Colors.grey[200]!;
  Color get backgroundColor => _backgroundColor;

  Color _primaryColor = MyColors.primary;
  Color get primaryColor => _primaryColor;
  Color _secondaryColor = MyColors.secondary;
  Color get secondaryColor => _secondaryColor;

/*   Color _headTitleColor = MyColors.secondary;
  Color get headTitleColor => _headTitleColor; */

  Color _bottomBarColor = MyColors.secondary;
  Color get bottomBarColor => _bottomBarColor;

  /* Color _floatingButtonColor = MyColors.primary;
  Color get floatingButtonColor => _floatingButtonColor;
  Color _floatingButtonTextColor = MyColors.secondary;
  Color get floatingButtonTextColor => _floatingButtonTextColor; */

  Color _unselectedItemColor = MyColors.grey;
  Color get unselectedItemColor => _unselectedItemColor;

  Color _selectedItemColor = MyColors.primary;
  Color get selectedItemColor => _selectedItemColor;

/*   Color _buttonColor = MyColors.secondary;
  Color get buttonColor => _buttonColor;
  Color _buttonTextColor = Colors.white;
  Color get buttonTextColor => _buttonTextColor; */

  final Rx<TextStyle> _fontStyle = Rx(const TextStyle());
  Rx<TextStyle> get fontFamily => _fontStyle;

  /// selectActionColor color
/*   selectActionColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _appBarActionColor = value;
          update();
        }
      },
      initialColor: appBarActionColor,
    );
  } */

  selectFontFamily(PickerFont font) {
    fontFamily.value = font.toTextStyle();
    log('${fontFamily.value.fontFamily}');
    update();
  }

  /// selectDrawerBackgroundColor color
  selectDrawerBackgroundColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _drawerBackgroundColor = value;
          update();
        }
      },
      initialColor: drawerBackgroundColor,
    );
  }

  /// selectBackgroundColor color
  selectBackgroundColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _backgroundColor = value;
          update();
        }
      },
      initialColor: backgroundColor,
    );
  }

  /// selectSecondaryAppColor color
  selectSecondaryColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _secondaryColor = value;
          update();
        }
      },
      initialColor: secondaryColor,
    );
  }

  /// selectMainAppColor color
  selectPrimaryColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _primaryColor = value;
          update();
        }
      },
      initialColor: primaryColor,
    );
  }

/*   /// selectHeadTitleColor color
  selectHeadTitleColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _headTitleColor = value;
          update();
        }
      },
      initialColor: headTitleColor,
    );
  } */

  /// selectBottomBarColor color
  selectBottomBarColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _bottomBarColor = value;
          update();
        }
      },
      initialColor: bottomBarColor,
    );
  }

  /// selectUnselectedItemColor color
  selectUnselectedItemColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _unselectedItemColor = value;
          update();
        }
      },
      initialColor: _unselectedItemColor,
    );
  }

  /// selectSelectedItemColor color
  selectSelectedItemColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _selectedItemColor = value;
          update();
        }
      },
      initialColor: _selectedItemColor,
    );
  }

  /// selectButtonColor color
/*   selectButtonColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _buttonColor = value;
          update();
        }
      },
      initialColor: buttonColor,
    );
  } */

  /// selectButtonTextColor color
/*   selectButtonTextColor() {
    ChosesColor.chooseColor(
      (value) {
        if (value != null) {
          _buttonTextColor = value;
          update();
        }
      },
      initialColor: buttonTextColor,
    );
  } */

  /// selectFloatingButtonColor color
/*   selectFloatingButtonColor() {
    ChosesColor.chooseColor(
      (Color? value) {
        if (value != null) {
          _floatingButtonColor = value;
          update();
        }
      },
      initialColor: floatingButtonColor,
    );
  } */

  /// selectFloatingTextColor color
  /*  selectFloatingButtonTextColor() {
    ChosesColor.chooseColor(
      (Color? value) {
        if (value != null) {
          _floatingButtonTextColor = value;
          update();
        }
      },
      initialColor: floatingButtonColor,
    );
  }*/

  void onItemTapped(int index) {
    index = index;
    if (index == 0) {
      selectSelectedItemColor();
    }
    if (index == 1) {
      selectUnselectedItemColor();
    }
    update();
  }

  saveTheme() async {
    final result = await _saveThemeUseCase(
      // appBarActionColor: appBarActionColor,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      drawerBackgroundColor: drawerBackgroundColor,
      backgroundColor: backgroundColor,
      // headTitleColor: headTitleColor,
      bottomBarColor: bottomBarColor,
      // floatingButtonColor: floatingButtonColor,
      unselectedItemColor: unselectedItemColor,
      selectedItemColor: selectedItemColor,
    );

    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      ToastManager.showSuccess('saved');
      Get.offAndToNamed(Routes.bottom);
    });
  }
}
