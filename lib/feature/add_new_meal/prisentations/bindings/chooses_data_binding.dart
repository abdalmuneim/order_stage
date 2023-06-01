import 'package:get/get.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/controllers/chooses_data_controller.dart';
import 'package:orderstage/injection.dart';

class ChoosesDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoosesDataController>(() => ChoosesDataController(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));
  }
}
