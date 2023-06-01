import 'package:get/get.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/controllers/add_new_meal_controller.dart';

class AddNewMealBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewMealController>(() => AddNewMealController());
  }
}
