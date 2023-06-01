import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/cashback/data/enums/cashback_enum.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/cashback_controller.dart';
import 'package:orderstage/injection.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class DialogUseCode extends GetView<CashbackController> {
  DialogUseCode({
    super.key,
  });
  final CashbackController controller = Get.put(CashbackController(sl()));
  @override
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBar(
              backgroundColor: MyColors.secondary.withOpacity(.2),
              centerTitle: false,
              title: const CustomText(
                text: "خيارات كود الخصم",
                textAlign: TextAlign.start,
              ),
              actions: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
              leading: const SizedBox(),
            ),
            20.sh,

            /// more than one
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.globalKeyDialog,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (controller.useCodeManyTime.value ==
                            UseCodeManyTime.non &&
                        controller.forSpecificClient.isFalse) ...[
                      CustomText(
                        text: "قم باختيار احد الاختيارات في الاسفل",
                        fontSize: 8.sp,
                        color: Colors.red,
                      ),
                    ],
                    10.sh,
                    RadioListTile<UseCodeManyTime?>(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: UseCodeManyTime.onlyOne,
                      title: const CustomText(
                        text: "الاستخدام مره واحده للعميل الواحد",
                        fontWeight: FontWeight.w500,
                        color: MyColors.secondary,
                      ),
                      onChanged: (UseCodeManyTime? value) =>
                          controller.onChangeUseCodeManyTime(value!),
                      groupValue: controller.useCodeManyTime.value,
                    ),
                    20.sh,

                    /// only one use
                    RadioListTile<UseCodeManyTime?>(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: UseCodeManyTime.moreThanOne,
                      title: const CustomText(
                        text: "يمكن استخدامه اكثر من مره",
                        fontWeight: FontWeight.w500,
                        color: MyColors.secondary,
                      ),
                      onChanged: (UseCodeManyTime? value) =>
                          controller.onChangeUseCodeManyTime(value!),
                      groupValue: controller.useCodeManyTime.value,
                    ),
                    20.sh,

                    /// for Specific Client
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CheckboxListTile(
                        checkColor: MyColors.primary,
                        activeColor: MyColors.primary,
                        contentPadding: EdgeInsets.zero,
                        value: controller.forSpecificClient.value,
                        onChanged: (bool? value) =>
                            controller.onChangeSpecificClient(value!),
                        title: const CustomText(text: "تخصيص الكود لعميل محدد"),
                      ),
                    ),
                    20.sh,
                    controller.forSpecificClient.value
                        ? CustomTextFormField(
                            fillColor: Colors.white,
                            hintText: "ادخل رقم العميل",
                            validator: (value) => AppValidator.validateFields(
                                value, ValidationType.notEmpty, context),
                            textEditingController: controller.clintNumberCRT,
                          )
                        : const SizedBox(),
                    20.sh,

                    /// enter discount code
                    CustomTextFormField(
                      fillColor: Colors.white,
                      hintText: "ادخل كود الخصم",
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.notEmpty, context),
                      textEditingController: controller.couponCRT,
                    ),

                    50.sh,

                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.primary)),
                      onPressed: () => controller.discountCodeOptions(),
                      child: const CustomText(
                        color: MyColors.secondary,
                        text: "موافق",
                      ),
                    ),
                    20.sh,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
/*  */