import 'package:get/get.dart';

import 'package:orderstage/feature/printer/prisentation/controllers/printer_controller.dart';
import 'package:orderstage/injection.dart';

class PrinterSettingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PrintUseEthernetController>(() => PrintUseEthernetController());
    Get.lazyPut<PrintController>(() => PrintController(sl(), sl()));
  }
}
