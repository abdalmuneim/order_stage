import 'package:get/get.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/edit_cashback_controller.dart';
import 'package:orderstage/injection.dart';

class EditCashbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCashbackController>(() => EditCashbackController(sl()));
  }
}
