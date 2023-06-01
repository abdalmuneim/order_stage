import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/save_options/add_meal_controller.dart';
import 'package:orderstage/core/helper/save_options/data/selected_copy_option_enum.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:sizer/sizer.dart';

import 'widgets/multi_select_dialog_field.dart';

class SaveOptions extends GetView<SaveOptionsController> {
  final String title;

  const SaveOptions(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async {
          Get.back(result: false);
          // Get.back();
          return false;
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(
                    builder: (context) {
                      List list = [
                        'خيارات الحفظ' '...',
                        'حفظ فقط',
                        'حفظ في باقي الفروع',
                        'حفظ هنا و في باقي الفروع'
                      ];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Obx(() => DropdownButton(
                            underline: const SizedBox(),
                            items: list
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ))
                                .toList(),
                            value:
                                list[controller.selectedCopyOption.value.index],
                            onChanged: (value) {
                              controller.selectedCopyOption.value =
                                  SelectedCopyOptionEnum
                                      .values[list.indexOf(value.toString())];

                              if (controller.selectedCopyOption.value ==
                                  SelectedCopyOptionEnum.copy) {
                                controller.selectedBranches.value = [
                                  // Misc.rest!
                                  Facility.single(id: 12867),
                                ];
                              } else {
                                if (controller.selectedCopyOption.value.index <
                                    2) controller.selectedBranches.clear();
                              }
                            })),
                      );
                    },
                  ),

                  Obx(() => Visibility(
                        visible: controller.selectedCopyOption.value.index > 1,
                        child: Card(
                          color: Colors.white,
                          child: controller.showProgress.value
                              ? const CircularProgressIndicator()
                              : CustomMultiSelectDialogField<Facility>(
                                  title: "branch",
                                  text: 'قم باختيار الفرع / الفروع',
                                  multiKey: controller.multiSelectBranchesKey,
                                  items: controller.itemsBranches,
                                  onConfirm: (List<Facility> results) =>
                                      controller.selectedBranchesList(results),
                                  decoration: const BoxDecoration(border: null),
                                  icon: const Icon(
                                    Icons.chevron_right,
                                    color: MyColors.secondary,
                                  ),
                                ),
                        ),
                      )),

                  24.sh,
                  //cancel
                  Obx(
                    () {
                      if (controller.selectedBranches.isNotEmpty) {
                        if (controller.selectedCopyOption.value !=
                            SelectedCopyOptionEnum.na) {
                          return Center(
                            child: MaterialButton(
                                onPressed: () => Get.back(result: true),
                                color: MyColors.primary,
                                child: Text(
                                  "accept",
                                  style: TextStyle(
                                      color: MyColors.secondary,
                                      fontSize: 10.sp),
                                )),
                          );
                        }
                      }
                      return Center(
                        child: MaterialButton(
                            onPressed: () => Get.back(result: false),
                            color: Colors.grey,
                            child: Text(
                              "cancel",
                              style: TextStyle(
                                  color: MyColors.secondary, fontSize: 10.sp),
                            )),
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
