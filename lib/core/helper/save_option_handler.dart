import 'dart:developer';

import 'package:get/get.dart';
import 'package:orderstage/core/helper/save_options/add_meal_controller.dart';
import 'package:orderstage/core/helper/save_options/data/selected_copy_option_enum.dart';
import 'package:orderstage/core/helper/save_options/save_options_page.dart';

class SaveOptionsHandeler {
  static void goToSaveOptions(
      Map<String, dynamic> dataToPst, String facilitiesName,
      {required String title,
      required Future Function(Map<String, dynamic> data) callBack}) {
    Get.to(() => SaveOptions(title),
            preventDuplicates: false,
            transition: Transition.downToUp,
            fullscreenDialog: true, binding: BindingsBuilder(() {
      Get.lazyPut(() => SaveOptionsController());
    }))!
        .then((value) {
      if (value == false) {
        // Get.back();
        return;
      }

      SaveOptionsController saveController = Get.find<SaveOptionsController>();
      log(saveController.selectedCopyOption.toString());

      List<int> facs = [];
      if (saveController.selectedCopyOption.value ==
          SelectedCopyOptionEnum.copy) {
        facs = [12867];
      } else {
        facs = saveController.selectedBranches
            .map((element) => element.id!)
            .toList();
      }

      facs = saveController.selectedCopyOption.value ==
              SelectedCopyOptionEnum.copyAndOthers
          ? [12867, ...facs]
          : facs;

      final map = {facilitiesName: facs, ...dataToPst};

      log(map.toString());

      callBack(map);

      /*    loyaltyDetails;
      processAction(
          loyaltyDetails,
          saveController.selectedCopyOption.value ==
                  SelectedCopyOptionEnum.copyAndOthers
              ? [Misc.rest!.id, ...facs]
              : facs); */
    });
  }
}
