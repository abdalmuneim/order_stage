// To parse this JSON data, do
//
//     final appModel = appModelFromMap(jsonString);

import 'dart:convert';

List<AppModel> appModelFromMap(List<dynamic> str) => List<AppModel>.from(
    List.generate(str.length, (index) => AppModel.fromMap(str[index])));

List<Meals> mealModelFromMap(List<dynamic> str) => List<Meals>.from(
    List.generate(str.length, (index) => Meals.fromMap(str[index])));

String appModelToMap(List<AppModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AppModel {
  int? id;
  String? appName;
  double? percentage;
  bool? deleted;
  int? facId;
  List<Meals>? meals;

  AppModel(
      {this.id,
      this.appName,
      this.percentage,
      this.deleted,
      this.facId,
      this.meals});

  AppModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    appName = json['appName'];
    percentage = json['percentage'];
    deleted = json['deleted'];
    facId = json['facId'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appName'] = appName;
    data['percentage'] = percentage;
    data['deleted'] = deleted;
    data['facId'] = facId;
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Meals {
  int? id;
  String? title;
  String? titleEn;
  String? volume;
  String? flavors;
  int? calories;
  String? description;
  String? descriptionEn;
  double? price;
  double? oldPrice;
  int? catId;
  int? facId;
  // dynamic extras;

  Meals({
    this.id,
    this.title,
    this.titleEn,
    this.volume,
    this.flavors,
    this.calories,
    this.description,
    this.descriptionEn,
    this.price,
    this.oldPrice,
    this.catId,
    this.facId,
    // this.extras,
  });

  Meals.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['titleEn'];
    volume = json['volume'];
    flavors = json['flavors'];
    calories = json['calories'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    price = json['price'];
    oldPrice = json['price'];
    catId = json['catId'];
    facId = json['facId'];
    // extras = json['extras'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['titleEn'] = titleEn;
    data['volume'] = volume;
    data['flavors'] = flavors;
    data['calories'] = calories;
    data['description'] = description;
    data['descriptionEn'] = descriptionEn;
    data['price'] = price;
    data['oldPrice'] = oldPrice;
    data['catId'] = catId;
    data['facId'] = facId;
    // data['extras'] = extras;
    return data;
  }
}
