import 'package:get/get.dart';
import 'package:orderstage/feature/add/prisentations/controllers/add_controller.dart';

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(() => AddController());
  }
}
