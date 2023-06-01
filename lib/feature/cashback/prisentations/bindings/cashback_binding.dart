import 'package:get/get.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/cashback_controller.dart';
import 'package:orderstage/injection.dart';

class CashbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CashbackController>(() => CashbackController(sl()));
  }
}

/*  */
