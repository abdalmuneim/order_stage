import 'dart:convert';

import 'package:blue_print_pos/models/models.dart';

List<DeviceModel> bluetoothPrinterFromMap(String str) =>
    List<DeviceModel>.from(json.decode(str).map((x) => DeviceModel.fromMap(x)));

String bluetoothPrinterToMap(List<DeviceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DeviceModel extends BlueDevice {
  DeviceModel({
    required super.name,
    required super.address,
    required super.type,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> json) => DeviceModel(
        name: json["name"],
        address: json["address"],
        type: json["type"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
        "type": type,
      };
}
