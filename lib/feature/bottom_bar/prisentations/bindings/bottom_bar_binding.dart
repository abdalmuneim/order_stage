import 'package:get/get.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/controllers/bottom_bar_controller.dart';
import 'package:orderstage/feature/theme/presintations/controller/dynamic_theme_controller.dart';
import 'package:orderstage/injection.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<DynamicThemeController>(() => DynamicThemeController(sl()));
  }
}
