import 'package:get/get.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/controllers/main_bar_controller.dart';

class MainBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBarController>(() => MainBarController());
  }
}
