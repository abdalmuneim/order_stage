import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/core/helper/validator.dart';
import 'package:orderstage/feature/add/prisentations/controllers/add_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'package:orderstage/widgets/custom_text_field.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(
      init: AddController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, right: 8, top: 8, left: 8),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CustomText(
                                text: 'سعر الوجية: ',
                                color: MyColors.secondary,
                              ),
                              OutlinedButton(
                                onPressed: null,
                                child: CustomText(
                                  text: 'شامل الضريبة',
                                  color: MyColors.grey,
                                ),
                              )
                            ],
                          ),
                          const CustomText(
                            text:
                                'ملاحظه التطييق لا ياخذ اي عمله او نسبه من سعر الوجبات، ولذا نأمل تسجيل سعر الوجبة حسب اسعار المطعم',
                            fontSize: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 4,
                              ),
                              5.sw,
                              const CustomText(
                                text: 'الاضافات المتاحه للوجبة:',
                                color: MyColors.secondary,
                              ),
                            ],
                          ),
                          16.sh,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              CustomText(text: 'اسم الوجبه'),
                              CustomText(text: 'سعر الوجبه'),
                              CustomText(text: 'تفصيل الوجبه'),
                            ],
                          ),

                          /// list of items added
                          Visibility(
                            visible: controller.add.isNotEmpty,
                            child: Wrap(
                              children: controller.add
                                  .map((e) => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          /// button remove add
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () =>
                                                controller.remove(e.id!),
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.red,
                                            ),
                                          ),
                                          CustomText(text: e.title ?? ""),
                                          10.sw,
                                          CustomText(text: e.price.toString()),
                                          10.sw,
                                          Expanded(
                                              child: CustomText(
                                                  text: e.cookies ?? "")),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                          16.sh,

                          /// fields add new item
                          Form(
                            key: controller.globalKey,
                            child: ExpansionTile(
                              key: GlobalKey(),
                              initiallyExpanded: controller.isVisible,
                              onExpansionChanged: (bool val) {
                                controller.isVisible = val;
                              },
                              trailing: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      side: const BorderSide(
                                        color: MyColors.secondary,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () => controller.visible(),
                                child: CustomText(
                                  text: controller.isVisible ? 'إغلاق' : 'اضفة',
                                  color: MyColors.secondary,
                                ),
                              ),
                              title: const CustomText(
                                text:
                                    'ضع صفرا مكان السعر اذا كانت الاضافات مجانية',
                                fontSize: 13,
                              ),
                              children: [
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: CustomTextFormField(
                                        validator: (value) =>
                                            AppValidator.validateFields(
                                                value,
                                                ValidationType.notEmpty,
                                                context),
                                        hintText: 'مكسرات مثلا',
                                        filled: false,
                                        fillColor: Colors.white,
                                        textEditingController: controller.title,
                                      ),
                                    ),
                                    10.sw,
                                    Expanded(
                                      child: CustomTextFormField(
                                        validator: (value) =>
                                            AppValidator.validateFields(
                                                value,
                                                ValidationType.notEmpty,
                                                context),
                                        hintText: 'السعر',
                                        isNumberOnly: true,
                                        filled: false,
                                        fillColor: Colors.white,
                                        textEditingController: controller.price,
                                      ),
                                    ),
                                  ],
                                ),
                                10.sh,
                                CustomTextFormField(
                                  validator: (value) =>
                                      AppValidator.validateFields(value,
                                          ValidationType.notEmpty, context),
                                  hintText: 'cookies for example',
                                  maxLines: 5,
                                  minLines: 1,
                                  filled: false,
                                  fillColor: Colors.white,
                                  textEditingController: controller.cookies,
                                ),
                                20.sh,
                                MaterialButton(
                                  color: MyColors.secondary,
                                  onPressed: () {
                                    if (controller.globalKey.currentState!
                                        .validate()) {
                                      controller.addFun();
                                    }
                                  },
                                  splashColor: Colors.blueGrey,
                                  child: const Text(
                                    'إضافة',
                                    style: TextStyle(
                                      color: MyColors.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...List.generate(
                      4,
                      (index) => SizedBox(
                            width: double.infinity,
                            height: 15.h,
                            child: Card(
                              child: Center(
                                child: Text(
                                  index.toString(),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
