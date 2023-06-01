import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/cashback/data/enums/cashback_enum.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/edit_cashback_controller.dart';
import 'package:orderstage/feature/cashback/prisentations/pages/widgets/edit_dialog_use_code.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class EditCashbackPage extends GetView<EditCashbackController> {
  const EditCashbackPage({super.key, required this.cashback});

  final CashbackData cashback;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('إداره العروض والتخفيضات')),
        body: Form(
          key: controller.globalKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              const CustomText(
                text: "تعديل بيانات العرض والتخفيض:",
                fontWeight: FontWeight.bold,
              ),
              30.sh,
              CustomTextFormField(
                textEditingController: controller.titleOfOfferCRT,
                hintText: "عنوان العرض",
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.notEmpty, context),
                autovalidateMode: AutovalidateMode.always,
              ),
              30.sh,

              /// offer time
              Card(
                child: ExpansionTile(
                  title: const CustomText(text: "فتره العرض"),
                  children: [
                    Container(
                      width: 100.w,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          12.sh,

                          /// from
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(
                                        controller.dateTimeNow.year + 1,
                                        controller.dateTimeNow.month + 7,
                                      ),
                                      onConfirm: (date) =>
                                          controller.onChangeDateTimeFrom(date),
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.ar);
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const CustomText(text: "من"),
                                      10.sw,
                                      const Icon(Icons.arrow_back_ios_new_sharp,
                                          size: 18),
                                    ],
                                  ),
                                ),
                              ),
                              CustomText(
                                text: controller.timeFromView.value,
                              ),
                            ],
                          ),
                          20.sh,

                          /// to
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(
                                        controller.dateTimeNow.year + 1,
                                        controller.dateTimeNow.month + 7,
                                      ),
                                      onConfirm: (date) =>
                                          controller.onChangeDateTimeTo(date),
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.ar);
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const CustomText(text: "الي"),
                                      10.sw,
                                      const Icon(Icons.arrow_back_ios_new_sharp,
                                          size: 18),
                                    ],
                                  ),
                                ),
                              ),
                              CustomText(
                                text: controller.timeToView.value,
                              ),
                            ],
                          ),
                          20.sh,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              5.sh,
              if (controller.timeFromView.isEmpty ||
                  controller.timeToView.isEmpty) ...[
                CustomText(
                  text: "يجب تحديد فتره العرض",
                  fontSize: 8.sp,
                  color: Colors.red,
                ),
              ],
              30.sh,

              /// discount type
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// with discount code
                    RadioListTile<DiscountType?>(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: DiscountType.withCode,
                      title: const CustomText(
                        text: "تخفيضات بكود خصم",
                        fontWeight: FontWeight.w500,
                        color: MyColors.secondary,
                      ),
                      onChanged: (DiscountType? value) =>
                          controller.onChangeDiscountType(value!),
                      groupValue: controller.discountType.value,
                    ),
                    controller.discountType.value == DiscountType.withCode
                        ? Container(
                            margin: EdgeInsets.only(top: 10, right: 12.w),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: ListTile(
                              title: CustomText(
                                text: "كود التخفيض:",
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                              trailing: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomText(
                                  fontSize: 8.sp,
                                  text: "يمكن استخدامه اكثر من مره",
                                ),
                              ),
                              onTap: () {
                                Get.dialog(
                                  const Dialog(
                                    child: EditDialogUseCode(),
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                    5.sh,
                    if (controller.discountType.value ==
                            DiscountType.withCode &&
                        (controller.useCodeManyTime.value ==
                                UseCodeManyTime.non &&
                            controller.forSpecificClient.isFalse)) ...[
                      Center(
                        child: CustomText(
                          text: "يجب إدخال الكود وتحديده      إضغط هنا👆",
                          fontSize: 8.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                    20.sh,

                    /// without discount code
                    RadioListTile<DiscountType?>(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: DiscountType.withoutCode,
                      title: const CustomText(
                        text: "تخفيضات بدون كود خصم",
                        fontWeight: FontWeight.w500,
                        color: MyColors.secondary,
                      ),
                      onChanged: (DiscountType? value) =>
                          controller.onChangeDiscountType(value!),
                      groupValue: controller.discountType.value,
                    ),
                  ],
                ),
              ),
              30.sh,

              /// field Amount of the invoice
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.always,
                hintText: "مبلغ الفاتوره",
                labelText: "مبلغ الفاتوره",
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                textEditingController: controller.totalLimitCRT,
                isNumberOnly: true,
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.notEmpty, context),
              ),

              /// field payback ratio
              30.sh,
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.always,
                hintText: "نسبه الاسترداد",
                labelText: "نسبه الاسترداد",
                isNumberOnly: true,
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.notEmpty, context),
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                textEditingController: controller.percentageCRT,
              ),
              20.sh,
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 12)),
                    backgroundColor:
                        MaterialStateProperty.all(MyColors.primary)),
                onPressed: controller.isLoading.value
                    ? () {}
                    : () => controller.saveEditCoupon(),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const CustomText(
                        color: MyColors.secondary,
                        text: "تعديل",
                      ),
              ),
              50.sh,
            ],
          ),
        ),
      );
    });
  }
}
