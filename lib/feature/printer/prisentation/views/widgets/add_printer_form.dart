import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/printer/prisentation/controllers/printer_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:orderstage/widgets/custom_text_field.dart';

class FormAddIPAddressPrinter extends GetView<PrintController> {
  FormAddIPAddressPrinter({
    super.key,
  });
  final focus0 = FocusNode();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: controller.globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              30.sh,

              /// printer name
              CustomTextFormField(
                textInputAction: TextInputAction.next,
                autofocus: true,
                focusNode: focus0,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus4);
                },
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.notEmpty, context),
                filled: false,
                fillColor: Colors.white,
                border: true,
                textEditingController: controller.printerName.value,
                labelText: 'اسم الطابعة',
                hintText: 'مثال: المطبخ',
              ),
              20.sh,
              const Text(
                'ادخل عنوان IP',
                textAlign: TextAlign.start,
              ),
              20.sh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// first index ip
                  Expanded(
                    child: CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      focusNode: focus1,
                      onFieldSubmitted: (v) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "مطلوب";
                        }
                        if (value.startsWith("0")) {
                          return "خطاء";
                        }
                        if (int.parse(value) > 255) {
                          return "اكبر من\n255";
                        }
                        if (int.parse(value) <= 0) {
                          return "اصغر من\n0";
                        }
                        return null;
                      },
                      isNumberOnly: true,
                      onChange: (value) {
                        controller.onChangeIP1(value);
                        if (value.length == 3) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus2);
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      counterText: '',
                      border: true,
                      hintText: '000',
                      fillColor: Colors.white,
                    ),
                  ),
                  points(),

                  /// seconde index ip
                  Expanded(
                    child: CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      focusNode: focus2,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus1);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "مطلوب";
                        }
                        if (int.parse(value) > 255) {
                          return "اكبر من\n255";
                        }

                        return null;
                      },
                      isNumberOnly: true,
                      onChange: (value) {
                        controller.onChangeIP2(value);
                        if (value.length == 3) {
                          FocusScope.of(context).requestFocus(focus1);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus3);
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      counterText: '',
                      border: true,
                      hintText: '000',
                      fillColor: Colors.white,
                    ),
                  ),
                  points(),

                  /// three index ip
                  Expanded(
                    child: CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      focusNode: focus3,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus2);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "مطلوب";
                        }
                        if (int.parse(value) > 255) {
                          return "اكبر من\n255";
                        }

                        return null;
                      },
                      isNumberOnly: true,
                      onChange: (value) {
                        controller.onChangeIP3(value);
                        if (value.length == 3) {
                          FocusScope.of(context).requestFocus(focus2);
                        }
                        if (value.isEmpty) {
                          FocusScope.of(context).requestFocus(focus4);
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      counterText: '',
                      border: true,
                      hintText: '000',
                      fillColor: Colors.white,
                    ),
                  ),
                  points(),

                  /// four index ip
                  Expanded(
                    child: CustomTextFormField(
                      focusNode: focus4,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus3);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "مطلوب";
                        }
                        if (value.startsWith("0")) {
                          return "خطاء";
                        }
                        if (int.parse(value) > 255) {
                          return "اكبر من\n255";
                        }

                        if (int.parse(value) <= 0) {
                          return "اصغر من\n0";
                        }
                        return null;
                      },
                      isNumberOnly: true,
                      fillColor: Colors.white,
                      onChange: (value) {
                        controller.onChangeIP4(value);
                        if (value.length == 3) {
                          FocusScope.of(context).requestFocus(focus3);
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      counterText: '',
                      border: true,
                      hintText: '000',
                    ),
                  ),
                ],
              ),
              20.sh,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyColors.primary,
                        ),
                      ),
                      onPressed: () => controller.addNetworkPrinter(),
                      child: const CustomText(
                        text: 'اضافة',
                        color: MyColors.secondary,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey.shade100,
                        ),
                      ),
                      onPressed: () {
                        controller.clearFields();
                        Get.back();
                      },
                      child: const CustomText(
                        text: 'الغاء',
                      ),
                    ),
                  ],
                ),
              ),

              20.sh,
            ],
          ),
        ),
      ),
    );
  }
}

Padding points() {
  return const Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8),
    child: Icon(
      Icons.circle,
      size: 5,
      color: MyColors.grey,
    ),
  );
}
