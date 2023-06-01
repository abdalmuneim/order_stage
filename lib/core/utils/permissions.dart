import 'package:permission_handler/permission_handler.dart';

class UtilsPermissions {
  static askPermission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.location,
    ].request();

    /// permission bluetooth
    if (statuses[Permission.bluetooth]!.isDenied) {
      await Permission.bluetooth.request().then((value) {
        if (!value.isGranted) askPermission();
      });
    }

    /// permission location
    if (statuses[Permission.location]!.isDenied) {
      await Permission.location.request().then((value) {
        if (!value.isGranted) askPermission();
      });
    }
  }
}
