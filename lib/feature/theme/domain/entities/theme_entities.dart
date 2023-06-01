import 'package:flutter/material.dart';

class ThemeEntities {
  // final Color? appBarActionColor;
  final Color? drawerBackgroundColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;
  // final Color? headColor;
  // final Color? headTitleColor;
  final Color? bottomBarColor;
  // final Color? floatingButtonColor;
  final Color? unselectedItemColor;
  final Color? selectedItemColor;
  // final int? iconSize;
  const ThemeEntities({
    this.primaryColor,
    this.secondaryColor,
    // this.appBarActionColor,
    this.drawerBackgroundColor,
    this.backgroundColor,
    // this.headColor,
    // this.headTitleColor,
    this.bottomBarColor,
    // this.floatingButtonColor,
    this.unselectedItemColor,
    this.selectedItemColor,
    // this.iconSize,
  });

  ThemeEntities copyWith({
    // Color? appBarActionColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? background,
    Color? drawerBackgroundColor,
    // Color? headColor,
    // Color? headTitleColor,
    Color? bottomBarColor,
    // Color? floatingButtonColor,
    Color? unselectedItemColor,
    Color? selectedItemColor,
    // int? iconSize,
  }) {
    return ThemeEntities(
      // appBarActionColor: appBarActionColor ?? this.appBarActionColor,
      drawerBackgroundColor: drawerBackgroundColor ?? drawerBackgroundColor,
      primaryColor: primaryColor ?? drawerBackgroundColor,
      secondaryColor: secondaryColor ?? secondaryColor,
      backgroundColor: background ?? backgroundColor,
      // headColor: headColor ?? this.headColor,
      // headTitleColor: headTitleColor ?? this.headTitleColor,
      bottomBarColor: bottomBarColor ?? this.bottomBarColor,
      // floatingButtonColor: floatingButtonColor ?? this.floatingButtonColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      // iconSize: iconSize ?? this.iconSize,
    );
  }
}
