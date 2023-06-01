// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:orderstage/core/utils/fields.dart';
import 'package:orderstage/feature/theme/domain/entities/theme_entities.dart';

class ThemeModel extends ThemeEntities {
  const ThemeModel({
    // super.appBarActionColor,
    super.drawerBackgroundColor,
    super.backgroundColor,
    super.primaryColor,
    super.secondaryColor,
    // super.headTitleColor,
    super.bottomBarColor,
    // super.floatingButtonColor,
    super.unselectedItemColor,
    super.selectedItemColor,
    // super.iconSize,
  });

  factory ThemeModel.fromMap(Map<String, dynamic> json) => ThemeModel(
        // appBarActionColor: Color(int.parse(json[Fields.appBarActionColor])),
        drawerBackgroundColor:
            Color(int.parse(json[Fields.drawerBackgroundColor])),
        backgroundColor: Color(int.parse(json[Fields.backgroundColor])),
        primaryColor: Color(int.parse(json[Fields.primaryColor])),
        secondaryColor: Color(int.parse(json[Fields.secondaryColor])),
        // headTitleColor: Color(int.parse(json[Fields.headTitleColor])),
        bottomBarColor: Color(int.parse(json[Fields.bottomBarColor])),
        // floatingButtonColor: Color(int.parse(json[Fields.floatingButtonColor])),
        unselectedItemColor: Color(int.parse(json[Fields.unselectedItemColor])),
        selectedItemColor: Color(int.parse(json[Fields.selectedItemColor])),
        // iconSize: int.parse(json[Fields.iconSize]),
      );

  Map<String, String> toMap() => {
        // if (appBarActionColor != null)
        // Fields.appBarActionColor: appBarActionColor!.value.toString(),
        if (drawerBackgroundColor != null)
          Fields.drawerBackgroundColor: drawerBackgroundColor!.value.toString(),
        if (primaryColor != null)
          Fields.primaryColor: primaryColor!.value.toString(),
        if (secondaryColor != null)
          Fields.secondaryColor: secondaryColor!.value.toString(),
        if (backgroundColor != null)
          Fields.backgroundColor: backgroundColor!.value.toString(),
        // if (headColor != null) Fields.headColor: headColor!.value.toString(),
        // if (headTitleColor != null)
        // Fields.headTitleColor: headTitleColor!.value.toString(),
        if (bottomBarColor != null)
          Fields.bottomBarColor: bottomBarColor!.value.toString(),
        // if (floatingButtonColor != null)
        // Fields.floatingButtonColor: floatingButtonColor!.value.toString(),
        if (selectedItemColor != null)
          Fields.selectedItemColor: selectedItemColor!.value.toString(),
        if (unselectedItemColor != null)
          Fields.unselectedItemColor: unselectedItemColor!.value.toString(),
        // if (iconSize != null) Fields.iconSize: iconSize.toString(),
      };

  String toJson() => json.encode(toMap());

  factory ThemeModel.fromJson(String source) =>
      ThemeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
