import 'package:get/get.dart';
import 'package:orderstage/core/routes/routes.dart';

class AddNewMealController extends GetxController {
  copyData() {
    Get.back();
    Get.toNamed(Routes.newMealChoosesData);
  }

  addNew() {
    Get.back();
  }
}
