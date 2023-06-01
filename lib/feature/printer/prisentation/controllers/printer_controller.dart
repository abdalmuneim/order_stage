import 'package:app_settings/app_settings.dart';
import 'package:blue_print_pos/blue_print_pos.dart';
import 'package:blue_print_pos/models/models.dart';
import 'package:esc_pos_utils_plus/src/enums.dart' as paper;
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:get_storage/get_storage.dart';

import 'package:orderstage/core/resources/assets_manager.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/services/printer/bluetooth.dart';
import 'package:orderstage/core/services/printer/network.dart';
import 'package:orderstage/core/utils/bluetooth_info.dart';
import 'package:orderstage/core/utils/fields.dart';
import 'package:orderstage/core/utils/network_info.dart';
import 'package:orderstage/core/utils/utilties.dart';
import 'package:orderstage/feature/printer/data/models/blutooth_model.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/utils/toast_manager.dart';

///Users/macos/.pub-cache/hosted/pub.dev/esc_pos_utils_plus-2.0.1+6/lib/src/enums.dart
class PrintController extends GetxController {
  final NetworkInfo _networkInfo;
  final BluetoothInfo _bluetoothInfo;
  PrintController(this._networkInfo, this._bluetoothInfo);

  /// text Form fields
  final printerName = TextEditingController().obs;
  final RxString printerIP1 = '000'.obs;
  final RxString printerIP2 = '000'.obs;
  final RxString printerIP3 = '0'.obs;
  final RxString printerIP4 = '000'.obs;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  /// key for Form stat
  GlobalKey<FormState> get globalKey => _globalKey;

  /// bluetooth devices
  final RxList<BlueDevice> _blueDevices = <BlueDevice>[].obs;
  RxList<BlueDevice> get blueDevices => _blueDevices;

  /// network devices
  final RxList<BlueDevice> _networkDevices = <BlueDevice>[].obs;
  RxList<BlueDevice> get networkDevices => _networkDevices;

  /// selected device
  // ignore: unused_field
  BlueDevice? _selectedDevice;
  final Rx<BlueDevice?> _defaultPrinter = Rx(null);
  Rx<BlueDevice?> get defaultPrinter => _defaultPrinter;

  /// when scan bluetooth
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  /// when printing
  final RxBool _isLoadingToPrint = false.obs;
  RxBool get isLoadingToPrint => _isLoadingToPrint;

  /// text form fields ip address
  final RxBool _isVisible = false.obs;
  RxBool get isVisible => _isVisible;

  /// paper size
  Rx<paper.PaperSize> paperSize = Rx(paper.PaperSize.mm58);

  /// Get Storage
  final GetStorage _box = GetStorage();

  /// selected Device With Bluetooth
  void onPressedTest(BlueDevice device) async {
    isLoadingToPrint.value = true;

    if (device.type == 1) {
      printArabicTextToWiFiPrinter(
        DeviceModel(
            name: device.name, address: device.address, type: device.type),
        data: ["بس بقا يلا ماتقرفنيش", "كله قرف", "HIIIII"],
      );
      _isLoadingToPrint.value = false;
    } else {
      printArabicTextToBluetoothPrinter(
        DeviceModel(
            name: device.name, address: device.address, type: device.type),
        data: ["بس بقا يلا ماتقرفنيش", "كله قرف", "A&AAAAAAAA"],
      );
      _isLoadingToPrint.value = false;
    }
  }

  /// scan Bluetooth devices
  Future<void> onScanPressed() async {
    print("Scan Running");
    _isLoading.value = true;
    BluePrintPos.instance.scan().then(
      (List<BlueDevice> devices) {
        _blueDevices.value = devices;

        _isLoading.value = false;
        print("Scan Stopped");
        update();
      },
    );
  }

////////////// start on change text form fields //////////////
  onChangeIP1(String value) {
    printerIP1.value = value.toUpperCase();
    update();
  }

  onChangeIP2(String value) {
    printerIP2.value = value.toUpperCase();
    update();
  }

  onChangeIP3(String value) {
    printerIP3.value = value.toUpperCase();
    update();
  }

  onChangeIP4(String value) {
    printerIP4.value = value.toUpperCase();
    update();
  }

////////////// End on change text form fields //////////////

  /// add network printer
  addNetworkPrinter() async {
    if (_globalKey.currentState!.validate()) {
      _networkDevices.add(
        BlueDevice(
          address:
              '${printerIP4.value}.${printerIP3.value}.${printerIP2.value}.${printerIP1.value}',
          name: printerName.value.text,
          type: 1,
        ),
      );
      await _savePrinterNetwork();
      clearFields();
      Get.back();
      ToastManager.showSuccess('تم اضافة الطابعة', color: Colors.green);
    } else {
      ToastManager.showSuccess('من فضلك تاكد من حقل الادخال',
          color: Colors.red);
    }
  }

  /// delete printer
  deletePrinter(direction, BlueDevice index) {
    // Remove the item from the data source.

    _blueDevices.removeWhere((element) => element.address == index.address);
    _networkDevices.removeWhere((element) => element.address == index.address);
    _savePrinterNetwork();

    // Then show a snackbar.
    ToastManager.showSuccess('تم حزف الطابعة');
  }

  /// clear text form fields
  clearFields() {
    printerName.value.clear();
    onChangeIP1('');
    onChangeIP2('');
    onChangeIP3('');
    onChangeIP4('');
  }

  /// get paper size
  paperSizeChange(paper.PaperSize? value, {PaperSize? valueESC}) {
    paperSize.value = value!;
    // paperESC = value as PaperSize;
    update();
  }

  ////////////////////// start onInit /////////////////////
  @override
  void onInit() async {
    // await _listenToNetWork();
    await _listenToBluetooth();
    onScanPressed();
    await _getDefaultPrinter();
    await _getPrintersNetwork();

    super.onInit();
  }
  ////////////////////// end onInit /////////////////////

  /// save Default printer to GetStorage
  saveDefaultPrinter({required BlueDevice device}) async {
    await _box.write("DefaultPrinter", device.toMap());
    await _getDefaultPrinter();
    update();
  }

  /// get Default printer from GetStorage
  _getDefaultPrinter() async {
    final def = _box.read(Fields.DEFAULTPRINTER);

    if (def != null) {
      _defaultPrinter.value = BlueDevice.fromMap(def);
      update();
    }
  }

  /// save Network printers to GetStorage
  _savePrinterNetwork() async {
    List<Map<String, dynamic>> map = _networkDevices
        .map((e) => {
              "name": e.name,
              "address": e.address,
              "type": e.type,
            })
        .toList();
    await _box.write("NetworkPrinters", map);
    await _getPrintersNetwork();
  }

  /// get Network printers from GetStorage
  _getPrintersNetwork() async {
    final netPrs = _box.read(Fields.NETWORKPRINTER);
    if (netPrs != null) {
      _networkDevices.value = blueDeviceFromMap(netPrs);
    }
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      print("_listenToNetWork: $isConnect");
      if (isConnect) {
        Get.back();
      } else {
        Utils.showLottieDialog(
          lottie: AssetsManager.wifiConnection,
          text: "لا يوجد اتصال بالانترنت تحقق من تفعيله",
          action: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyColors.secondary,
                ),
              ),
              onPressed: () => AppSettings.openWIFISettings(),
              child: const CustomText(
                text: "تفعيل الواي فاي",
                color: MyColors.primary,
              ),
            ),
          ],
        );
      }
    });
  }

  _listenToBluetooth() {
    _bluetoothInfo.listenToBluetoothStream.onData((bool isConnect) {
      print("_listenToBluetooth: $isConnect");

      if (isConnect) {
        Get.back();
      } else {
        Utils.showLottieDialog(
            lottie: AssetsManager.bluetoothConnection,
            text: "لا يوجد اتصال بالبلوتوث تحقق من تفعيله",
            isBlue: true,
            action: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyColors.primary,
                  ),
                ),
                onPressed: () {
                  FlutterBluePlus.instance.turnOn();
                  Get.back();
                },
                child: const CustomText(
                  text: "تفعيل البلوتوث",
                  color: MyColors.secondary,
                ),
              ),
            ]);
      }
    });
  }

  @override
  void onClose() async {
    await _networkInfo.listenToNetworkStream.cancel();
    await _bluetoothInfo.listenToBluetoothStream.cancel();

    super.onClose();
  }
}
