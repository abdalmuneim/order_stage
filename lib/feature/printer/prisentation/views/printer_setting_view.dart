import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/printer/prisentation/controllers/printer_controller.dart';
import 'package:orderstage/feature/printer/prisentation/views/widgets/printer_card.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class PrinterSettingView extends GetView<PrintController> {
  const PrinterSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('الاعدادات'),
        ),
        body: Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                textDecoration: TextDecoration.underline,
                text: "الطابعة الافتراضية",
              ),
              10.sh,

              /// default printer
              if (controller.defaultPrinter.value != null) ...[
                PrinterCard(
                  device: controller.defaultPrinter.value!,
                ),
              ] else ...[
                const Center(
                  child: CustomText(
                    text: "لم يتم تحديد طابعة",
                  ),
                ),
              ],
              50.sh,

              /// dialog add printer
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyColors.primary),
                      maximumSize: MaterialStateProperty.all(Size(50.w, 50))),
                  onPressed: () {
                    Get.dialog(
                      Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppBar(
                              title: const CustomText(
                                text: 'إضافة طابعة',
                              ),
                              leading: IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                            20.sh,
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                text: "نوع الطابعة",
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                            20.sh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /// add bluetooth printer
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(8)),
                                    backgroundColor: MaterialStateProperty.all(
                                      MyColors.primary,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.toNamed(Routes.printers, arguments: {
                                      "isBlue": true,
                                      "devices": controller.blueDevices,
                                    });
                                  },
                                  child: const CustomText(
                                    text: 'بلوتوث',
                                    color: MyColors.secondary,
                                  ),
                                ),

                                /// add network printer
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(8)),
                                    backgroundColor: MaterialStateProperty.all(
                                      MyColors.secondary,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();

                                    Get.toNamed(Routes.printers, arguments: {
                                      "isBlue": false,
                                      "devices": controller.networkDevices,
                                    });
                                  },
                                  child: const CustomText(
                                    text: 'الشبكة',
                                    color: MyColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            20.sh
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'إضافة طابعة',
                        color: MyColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(
                        Icons.add,
                        color: MyColors.secondary,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
