import 'package:app_settings/app_settings.dart';
import 'package:blue_print_pos/models/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esc_pos_utils_plus/src/enums.dart';

import 'package:orderstage/core/resources/font_manager.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/printer/prisentation/controllers/printer_controller.dart';
import 'package:orderstage/feature/printer/prisentation/views/widgets/add_printer_form.dart';
import 'package:orderstage/feature/printer/prisentation/views/widgets/printer_card.dart';
import 'package:orderstage/widgets/custom_text.dart';

class PrintersView extends StatefulWidget {
  const PrintersView({
    super.key,
    required this.isBluetooth,
    required this.devices,
  });
  final bool isBluetooth;
  final List<BlueDevice> devices;

  @override
  State<PrintersView> createState() => _PrintersViewState();
}

PrintController controller = Get.find<PrintController>();

class _PrintersViewState extends State<PrintersView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (state == AppLifecycleState.resumed) {
      controller.onScanPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            Text(widget.isBluetooth ? 'الطابعات البلوتوث' : "الطابعات الشبكة"),
        actions: [
          controller.isLoading.value
              ? const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  onPressed: () => controller.onScanPressed(),
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.sh,

              widget.isBluetooth
                  ? Row(
                      children: [
                        TextButton(
                          onPressed: () => AppSettings.openBluetoothSettings(),
                          child: const Text(
                            "فتح اعدادات البلوتوث",
                            style: TextStyle(
                              fontFamily: FontConstants.almarai,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const CustomText(text: "لاضف طابعة"),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () => Get.dialog(
                            FormAddIPAddressPrinter(),
                          ),
                          child: const Text(
                            "اضف طابعة",
                            style: TextStyle(
                              fontFamily: FontConstants.almarai,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const CustomText(text: "علي الشبكة"),
                      ],
                    ),

              /// DEVICES
              Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.devices.map(
                      (BlueDevice blueDevice) {
                        final isDef = blueDevice.address ==
                            controller.defaultPrinter.value?.address;
                        print(isDef);
                        return PrinterCard(
                          isDefault: !isDef,
                          device: blueDevice,
                        );
                      },
                    ).toList(),
                  ),
                );
              }),

              /// chooses paper size
              20.sh,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('اختيار حجم الورقة'),
              ),
              Container(
                height: 50,
                color: MyColors.primary,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => DropdownButton<PaperSize>(
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: FontConstants.almarai,
                          color: MyColors.secondary),
                      underline: const SizedBox(),
                      dropdownColor: Colors.white,
                      hint: const Text('selecte printer size'),
                      items: const <DropdownMenuItem<PaperSize>>[
                        DropdownMenuItem(
                          value: PaperSize.mm58,
                          child: Text('mm58'),
                        ),
                        DropdownMenuItem(
                          value: PaperSize.mm72,
                          child: Text('mm72'),
                        ),
                        DropdownMenuItem(
                          value: PaperSize.mm80,
                          child: Text('mm80'),
                        ),
                      ],
                      value: controller.paperSize.value,
                      onChanged: controller.paperSizeChange,
                    )),
              ),

              10.sh,
            ],
          ),
        ),
      ),
    );
  }
}
