import 'package:blue_print_pos/models/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/printer/prisentation/controllers/printer_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';

class PrinterCard extends GetView<PrintController> {
  const PrinterCard({
    required this.device,
    this.isDefault = false,
    super.key,
  });
  final BlueDevice device;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.redAccent,
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerLeft,
        color: Colors.redAccent,
        child: const Icon(Icons.delete),
      ),
      key: Key(device.address),
      onDismissed: (direction) => controller.deletePrinter(direction, device),
      child: Card(
        elevation: .6,
        child: ListTile(
          title: Text(device.name),
          subtitle: Text(device.address),
          trailing: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isDefault) ...[
                  ElevatedButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                        MyColors.primary,
                      ),
                    ),
                    onPressed: () {
                      controller.saveDefaultPrinter(device: device);
                    },
                    child: const CustomText(
                      text: 'الافتراضية',
                      color: MyColors.secondary,
                    ),
                  ),
                ],
                10.sw,
                ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor:
                          MaterialStateProperty.all(MyColors.primary)),
                  onPressed: controller.isLoadingToPrint.value
                      ? () {}
                      : () {
                          controller.onPressedTest(device);
                        },
                  child: controller.isLoadingToPrint.value
                      ? const CircularProgressIndicator()
                      : const CustomText(
                          text: 'اختبار',
                          color: MyColors.secondary,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
