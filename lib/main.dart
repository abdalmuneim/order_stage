// import 'package:dart_ping_ios/dart_ping_ios.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:orderstage/core/resources/theme_manager.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/permissions.dart';
import 'package:sizer/sizer.dart' as sizer;
import 'package:orderstage/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await di.init();
  await UtilsPermissions.askPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return sizer.Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        locale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        supportedLocales: const [
          Locale('en', 'ar'),
        ],
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
      );
    });
  }
}
