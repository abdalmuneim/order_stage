import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/font_manager.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/controllers/chooses_data_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/multi_select_dialog_field.dart';

class ChoosesDataView extends StatelessWidget {
  const ChoosesDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoosesDataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("نسخ البيانات"),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomText(
                  text: "إختر من الوجبات",
                  fontWeight: FontWeightManager.bold,
                ),
                10.sh,
                const CustomText(
                  text: "قم باختيار من الوجبة / الوجبات التي تريد نسخها",
                ),
                20.sh,

                /// dialog for meals
                controller.isLoad.value
                    ? const CircularProgressIndicator()
                    : CustomMultiSelectDialogField<MealModel>(
                        title: 'الوجبات',
                        text: "اختر من قائمة الوجبات",
                        multiKey: controller.multiSelectMealKey,
                        items: controller.itemsMeals,
                        onConfirm: (List<MealModel> results) =>
                            controller.selectedMealsList(results),
                      ),
                50.sh,
                Obx(() => Visibility(
                      visible: controller.selectedMeals.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "إختر من الفروع",
                            fontWeight: FontWeightManager.bold,
                          ),
                          10.sh,
                          const CustomText(
                            text: "قم باختيار فروع / الفروع التي تريد نسخها",
                          ),
                          20.sh,

                          /// dialog for branches
                          controller.isLoad.value
                              ? const CircularProgressIndicator()
                              : CustomMultiSelectDialogField<Facility>(
                                  title: 'الفروع',
                                  text: "اختر من قائمة الفروع",
                                  multiKey: controller.multiSelectBranchesKey,
                                  items: controller.itemsBranches,
                                  onConfirm: (List<Facility> results) =>
                                      controller.selectedBranchesList(results),
                                ),
                          60.sh,
                        ],
                      ),
                    )),
                Obx(
                  () => Visibility(
                    visible: controller.selectedMeals.isEmpty &&
                        controller.selectedMeals.isEmpty,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () => controller.backClick(),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.primary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          child: const CustomText(
                            text: "إلغاء",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),

                /// save only or save and copy
                Obx(
                  () => Visibility(
                    visible: controller.selectedMeals.isNotEmpty ||
                        controller.selectedMeals.isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// save button
                        ElevatedButton(
                          onPressed: controller.isLoadSendSave.value
                              ? () {}
                              : () => controller.postMealCopy(),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyColors.secondary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(10)),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(150, 50))),
                          child: controller.isLoadSendSave.value
                              ? CircularProgressIndicator(
                                  color: MyColors.primary)
                              : CustomText(
                                  text: "نسخ",
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        20.sw,

                        /// save and copy
                        Obx(() => Visibility(
                              visible: controller.selectedBranches.isNotEmpty,
                              child: ElevatedButton(
                                  onPressed: controller.isLoadSendSaveCopy.value
                                      ? () {}
                                      : () => controller.postMealCopyToAll(),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(10)),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size(150, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                        MyColors.primary),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: controller.isLoadSendSaveCopy.value
                                      ? CircularProgressIndicator(
                                          color: MyColors.secondary)
                                      : const CustomText(
                                          text: "نسخ في الفروع",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
