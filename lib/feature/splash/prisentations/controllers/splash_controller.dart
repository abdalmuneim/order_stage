import 'dart:async';

import 'package:get/get.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/bluetooth_info.dart';
import 'package:orderstage/core/utils/network_info.dart';

class SplashController extends GetxController {
  final NetworkInfo _networkInfo;
  final BluetoothInfo _bluetoothInfo;

  SplashController(this._networkInfo, this._bluetoothInfo);

  _navigate() async {
    Get.offAllNamed(Routes.printerSetting);
  }

  _startTimer() async {
    _networkInfo.initializeNetworkStream();
    _bluetoothInfo.initializeBluetoothStream();
    Timer(const Duration(seconds: 2), () {
      _navigate();
    });
  }

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }
}
