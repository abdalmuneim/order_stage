// To parse this JSON data, do
//
//     final copyMealModel = copyMealModelFromMap(jsonString);

import 'dart:convert';

CopyMealModel copyMealModelFromMap(String str) =>
    CopyMealModel.fromMap(json.decode(str));

String copyMealModelToMap(CopyMealModel data) => json.encode(data.toMap());

class CopyMealModel {
  CopyMealModel({
    this.message,
    this.mealIds,
    this.facId,
    this.facilityId,
    this.facilitiesIdToCopyTo,
    this.all,
  });

  final List<int>? mealIds;
  final int? facId;
  final int? facilityId;
  final List<int>? facilitiesIdToCopyTo;
  final bool? all;

  final String? message;

  factory CopyMealModel.fromMap(Map<String, dynamic> json) => CopyMealModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["mealIds"] = List<dynamic>.from(mealIds!.map((x) => x));
    data["facilityId"] = facilityId;
    data["facId"] = facId;
    data["facilitiesIdToCopyTo"] =
        List<dynamic>.from(facilitiesIdToCopyTo!.map((x) => x));
    data["all"] = all;
    return data;
  }
}
