import 'package:get/get.dart';
import 'package:orderstage/feature/local_auth/prisentations/controllers/local_auth_controller.dart';

class LocalAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalAuthController>(() => LocalAuthController());
  }
}
