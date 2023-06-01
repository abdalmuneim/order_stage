import 'package:get/get.dart';
import 'package:orderstage/feature/theme/presintations/controller/theme_controller.dart';
import 'package:orderstage/injection.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController(sl()));
  }
}
