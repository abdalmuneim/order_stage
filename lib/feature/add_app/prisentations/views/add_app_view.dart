import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/add_app_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class AddAppView extends GetWidget<AddAppController> {
  const AddAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      <AddAppController>() {
        return Scaffold(
          appBar: AppBar(title: const Text('بيانات التطبيق')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    /// field app name
                    Row(
                      children: [
                        const CustomText(
                          text: 'إسم التطبيق:',
                        ),
                        10.sw,
                        Expanded(
                          child: CustomTextFormField(
                            validator: (value) => AppValidator.validateFields(
                                value, ValidationType.notEmpty, context),
                            hintText: 'اسم التطبيق',
                            filled: false,
                            fillColor: Colors.white,
                            textEditingController: controller.appName.value,
                            onChange: controller.onChangeAppName,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isAlreadyExists.value,
                        child: const CustomText(
                          text: 'هذا التطبيق موجود بالفعل',
                          color: Colors.red,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    20.sh,

                    /// field percentage
                    Row(
                      children: [
                        const CustomText(
                          text: 'نسبة الزيادة:',
                        ),
                        10.sw,
                        Container(
                          alignment: Alignment.center,
                          width: 20.w,
                          height: 20.w,
                          child: CustomTextFormField(
                            validator: (value) => AppValidator.validateFields(
                                value, ValidationType.notEmpty, context),
                            hintText: '10',
                            filled: false,
                            isNumberOnly: true,
                            fillColor: Colors.white,
                            textEditingController: controller.percentage.value,
                          ),
                        ),
                        const Icon(Icons.percent_rounded)
                      ],
                    ),
                    20.sh,

                    /// chooses meals
                    controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              if (controller.percentage.value.text.isEmpty) {
                                ToastManager.showError("من فضلك اخر النسبة");
                              } else {
                                Get.dialog(
                                  Dialog(
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        SingleChildScrollView(
                                          /// meals
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 30),
                                            child: Column(
                                              children: controller.itemsMeals
                                                  .map(
                                                    (Meals e) => Obx(() {
                                                      return InkWell(
                                                        onTap: () => controller
                                                            .selectedMealsList(
                                                                e),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          color: controller
                                                                  .isSelected(
                                                                      e.id ?? 0)
                                                              ? MyColors.primary
                                                              : Colors.white,
                                                          child: CustomText(
                                                            text: e.title ?? "",
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ),

                                        /// top buttons
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child: const CustomText(
                                                text: "تم",
                                                backgroundColor:
                                                    MyColors.primary,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.secondary,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () =>
                                                    controller.cancelSelect(),
                                                icon: const Icon(Icons.close)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                border: Border.all(
                                  color: MyColors.primary,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CustomText(text: 'إختر من الوجبات'),
                                  Icon(Icons.arrow_downward),
                                ],
                              ),
                            ),
                          ),
                    10.sh,
                    Obx(
                      () => Visibility(
                        visible: controller.selectedMeals.isNotEmpty,
                        child: const CustomText(text: 'تم الاختيار'),
                      ),
                    ),
                    if (controller.selectedMeals.isEmpty) ...[
                      const CustomText(
                        text: 'هذا الحقل مطلوب',
                        color: Colors.red,
                        fontSize: 13,
                      ),
                    ],
                    50.sh,

                    /// button add app
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyColors.secondary,
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 8))),
                        onPressed: () => controller.isAlreadyExists.value
                            ? () {}
                            : controller.isLoadingButton.value
                                ? () {}
                                : controller.addApp(),
                        child: controller.isLoadingButton.value
                            ? const CircularProgressIndicator(
                                color: MyColors.primary,
                              )
                            : const CustomText(
                                text: 'إضافة',
                                color: MyColors.primary,
                              ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
