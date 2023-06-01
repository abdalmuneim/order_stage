import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/edit_app_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class EditAppView extends GetWidget<EditAppController> {
  const EditAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      <EditAppController>() {
        return Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(controller.title.value)),
            actions: [
              IconButton(
                onPressed: () {
                  Get.dialog(
                    Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// field app name
                              Row(
                                children: [
                                  const CustomText(
                                    text: 'إسم التطبيق:',
                                  ),
                                  10.sw,
                                  Expanded(
                                    child: Obx(() => CustomTextFormField(
                                          border: true,
                                          validator: (value) =>
                                              AppValidator.validateFields(
                                                  value,
                                                  ValidationType.appName,
                                                  context),
                                          hintText: 'اسم التطبيق',
                                          onChange: controller.onChangeAppName,
                                          filled: false,
                                          fillColor: Colors.white,
                                          textEditingController:
                                              controller.appName.value,
                                        )),
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

                              /// field percent
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
                                      border: true,
                                      validator: (value) =>
                                          AppValidator.validateFields(value,
                                              ValidationType.notEmpty, context),
                                      hintText: '10',
                                      filled: false,
                                      isNumberOnly: true,
                                      fillColor: Colors.white,
                                      textEditingController:
                                          controller.percentage.value,
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
                                        if (controller
                                            .percentage.value.text.isEmpty) {
                                          ToastManager.showError(
                                              "من فضلك اختر النسبة");
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
                                                          const EdgeInsets.only(
                                                              top: 30),
                                                      child: Column(
                                                        children:
                                                            controller
                                                                .itemsMeals
                                                                .map(
                                                                  (Meals e) =>
                                                                      Obx(() {
                                                                    return InkWell(
                                                                      onTap: () =>
                                                                          controller
                                                                              .selectedMealsList(e),
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            const EdgeInsets.all(10),
                                                                        margin:
                                                                            const EdgeInsets.all(10),
                                                                        color: controller.isSelected(e.id)
                                                                            ? MyColors.primary
                                                                            : Colors.white,
                                                                        child:
                                                                            CustomText(
                                                                          text: e.title ??
                                                                              "",
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();

                                                            Get.back();
                                                          },
                                                          child:
                                                              const CustomText(
                                                            text: "تم",
                                                            color: MyColors
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();

                                                            Get.back();
                                                          },
                                                          icon: const Icon(
                                                              Icons.close)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
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
                              20.sh,
                              Obx(
                                () => Visibility(
                                  visible: controller.selectedMeals.isNotEmpty,
                                  child: const CustomText(text: 'تم الاختيار'),
                                ),
                              ),
                              Obx(() => Visibility(
                                    visible: controller.selectedMeals.isEmpty,
                                    child: const CustomText(
                                      text: 'هذا الحقل مطلوب',
                                      color: Colors.red,
                                      fontSize: 13,
                                    ),
                                  )),

                              50.sh,

                              /// edit app
                              Obx(() => ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          MyColors.secondary,
                                        ),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 8))),
                                    onPressed: controller.isAlreadyExists.value
                                        ? () {}
                                        : controller.isLoading.value
                                            ? () {}
                                            : () => controller.editApp(),
                                    child: controller.isLoading.value
                                        ? const CircularProgressIndicator(
                                            color: MyColors.primary,
                                          )
                                        : const CustomText(
                                            text: 'تعديل',
                                            color: MyColors.primary,
                                          ),
                                  )),

                              /// remove app
                              TextButton(
                                onPressed: () => controller.removeApp(),
                                child: const CustomText(
                                  text: "حزف التطبيق",
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ///  meals
                    controller.selectedMeals!.isEmpty
                        ? Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              CustomText(
                                  text: 'قم بالضغط علي الترس لاختيار الوجبات'),
                              Icon(Icons.arrow_upward)
                            ],
                          ))
                        : Wrap(
                            children: controller.selectedMeals
                                .map((Meals e) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyColors.grey,
                                            offset: Offset(1, 1),
                                            blurRadius: 5.5,
                                          ),
                                        ],
                                      ),
                                      width: 35.w,
                                      height: 18.h,
                                      child: Column(
                                        children: [
                                          /// meal name
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: CustomText(
                                              text: e.title ?? "",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),

                                          /// price
                                          Expanded(
                                            child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                color: MyColors.primary,
                                                child: CustomText(
                                                    text:
                                                        '${e.price.toString()} ر.س')),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                    20.sh,
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
