import 'package:get/get.dart';
import 'package:orderstage/feature/splash/prisentations/controllers/splash_controller.dart';
import 'package:orderstage/injection.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(sl(), sl()));
  }
}
