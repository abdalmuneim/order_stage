import 'package:get/get.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/apps_controller.dart';
import 'package:orderstage/injection.dart';

class AppsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppsController>(() => AppsController(sl()));
  }
}
