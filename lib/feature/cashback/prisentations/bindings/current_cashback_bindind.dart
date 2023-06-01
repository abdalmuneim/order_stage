import 'package:get/get.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/current_cashback_controller.dart';
import 'package:orderstage/injection.dart';

class CurrentCashbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurrentCashbackController>(
        () => CurrentCashbackController(sl()));
  }
}
