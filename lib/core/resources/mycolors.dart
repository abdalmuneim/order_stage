import 'dart:ui';

import 'package:get/state_manager.dart';
import 'package:get_it/get_it.dart';

class MyColors {
  static const Color primary = Color(0xfffccb55);
  static const Color gold = Color(0xfff99711);
  static const Color secondary = Color(0xff2f2f80);
  static const Color grey = Color(0xffBBBBCC);
}

GetIt getIt = GetIt.instance;
RxDouble currentLat = (-1.0).obs;
RxDouble currentLon = (-1.0).obs;

RxString selectedLang = 'ar'.obs;
