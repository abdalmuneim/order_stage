import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/types/auth_messages_ios.dart';
import 'package:orderstage/core/services/device_id.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/local_auth/data/enums/support_state_enum.dart';

class LocalAuthController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();

  ///
  final Rx<SupportState> _supportState = SupportState.unknown.obs;
  Rx<SupportState> get supportState => _supportState;

  final RxBool _canCheckBiometrics = false.obs;
  RxBool get canCheckBiometrics => _canCheckBiometrics;

  /// device id
  final RxString _deviceID = "".obs;
  RxString get deviceID => _deviceID;

  /// check device Supported Biometric
  _deviceSupportBiometric() async {
    await _auth.isDeviceSupported().then(
          (bool isSupported) => _supportState.value =
              isSupported ? SupportState.supported : SupportState.unsupported,
        );
    log("_supportState: $_supportState");
  }

  /// To check whether there is local authentication available on this device or not
  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      log(e.toString());
    }
    _canCheckBiometrics.value = canCheckBiometrics;
    log("_canCheckBiometrics: $_canCheckBiometrics");
  }

  /// authenticate
  Future<void> authenticate() async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        authMessages: <AuthMessages>[
          const AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          const IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);

    if (didAuthenticate) {
      final String? deviceId = await DeviceId.instance.getDeviceId();
      if (deviceId != null) {
        _deviceID.value = deviceId;
        log(_deviceID.value);
        log("Success");
        ToastManager.showSuccess("Success");
      }
    } else {
      ToastManager.showError("Oops! Biometric authentication required!");
    }
  }

  @override
  void onInit() async {
    //------------------ Start Biometric ------------------
    await _deviceSupportBiometric();
    await _checkBiometrics();
    //------------------ End Biometric ------------------
    super.onInit();
  }

  @override
  void onReady() {
    if (_supportState.value == SupportState.unsupported) {
      ToastManager.showError("App Not Support Biometric");
    }
    if (!_canCheckBiometrics.value) {
      ToastManager.showError("Should enable some Biometric");
    }
    super.onReady();
  }
}
