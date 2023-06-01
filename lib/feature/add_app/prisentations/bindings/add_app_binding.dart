import 'package:get/get.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/add_app_controller.dart';
import 'package:orderstage/injection.dart';

class AddAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAppController>(() => AddAppController(sl()));
  }
}
