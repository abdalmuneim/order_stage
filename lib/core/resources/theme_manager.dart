import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderstage/core/resources/mycolors.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// Main Color

    primaryColor: MyColors.primary,
    primaryColorLight: MyColors.gold,
    disabledColor: Colors.grey,
    fontFamily: FontConstants.almarai,
    canvasColor: MyColors.secondary,
    scaffoldBackgroundColor: Colors.grey.shade200,
    textTheme: GoogleFonts.almaraiTextTheme(),
    primaryTextTheme: GoogleFonts.almaraiTextTheme(),

    /// CardViewTheme

    cardTheme: const CardTheme(
        color: Colors.white, shadowColor: Colors.grey, elevation: 4),

    /// AppBar Theme

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: MyColors.primary,
      elevation: 0,
      shadowColor: Colors.black,
      iconTheme: IconThemeData(color: MyColors.secondary, size: 30),
      titleTextStyle: TextStyle(
        fontFamily: FontConstants.almarai,
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.medium,
        color: MyColors.secondary,
      ),
    ),

    /// icon theme
    iconTheme: const IconThemeData(color: MyColors.secondary, size: 30),
  );
}
