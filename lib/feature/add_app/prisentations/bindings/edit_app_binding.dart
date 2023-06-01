import 'package:get/get.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/edit_app_controller.dart';
import 'package:orderstage/injection.dart';

class EditAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAppController>(() => EditAppController(sl()));
  }
}
