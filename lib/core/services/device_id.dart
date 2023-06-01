import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class DeviceId {
  static DeviceId instance = _init;

  static final DeviceId _init = DeviceId();

  Future<String?> getDeviceId() async {
    String? deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    if (deviceId != null) {
      return deviceId;
    }
    return null;
  }
}
