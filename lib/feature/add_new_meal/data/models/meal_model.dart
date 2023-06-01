// To parse this JSON data, do
//
//     final mealModel = mealModelFromMap(jsonString);

import 'dart:convert';
import 'dart:math';

List<MealModel> mealModelFromMap(List<dynamic> str) => List<MealModel>.from(
    List.generate(str.length, (index) => MealModel.fromMap(str[index])));

List<Facility> facilityModelFromMap(List<dynamic> str) => List<Facility>.from(
    List.generate(str.length, (index) => Facility.fromMap(str[index])));

String mealModelToMap(List<MealModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MealModel {
  MealModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.volume,
    required this.flavors,
    required this.calories,
    required this.description,
    required this.descriptionEn,
    required this.price,
    required this.vat,
    this.oldPrice,
    required this.enable,
    required this.deleted,
    required this.preBook,
    required this.catId,
    required this.facId,
    required this.promoPercent,
    required this.image,
    required this.image2,
    required this.image3,
    required this.ordsCount,
    required this.facility,
    required this.extras,
    required this.code,
    required this.counter,
    required this.imageCount,
    required this.mealCat,
    required this.favorite,
  });

  final int id;
  final String title;
  final String code;
  final String titleEn;
  final String volume;
  final String flavors;
  final int calories;
  final String description;
  final String descriptionEn;
  final double price;
  final double? oldPrice;
  final double vat;
  final bool enable;
  final bool deleted;
  final bool preBook;
  final int catId;
  final int facId;
  final double promoPercent;
  final dynamic image;
  final dynamic image2;
  final dynamic image3;
  final int ordsCount;
  final Facility facility;
  final List<dynamic> extras;
  final int counter;
  final int imageCount;
  final List<MealCat> mealCat;
  final bool favorite;

  factory MealModel.fromMap(Map<String, dynamic> json) {
    final codeList =
        List.generate(26, (index) => String.fromCharCode(index + 65));

    return MealModel(
      id: json["id"],
      title: json["title"],
      code: json["code"] ??
          ('${codeList[Random().nextInt(26)]}${codeList[Random().nextInt(26)]}${json["id"]}'),
      titleEn: json["titleEn"],
      volume: json["volume"],
      flavors: json["flavors"],
      calories: json["calories"],
      description: json["description"],
      descriptionEn: json["descriptionEn"],
      price: json["price"],
      oldPrice: json["oldPrice"] ?? json["price"],
      vat: json["vat"]?.toDouble(),
      enable: json["enable"],
      deleted: json["deleted"],
      preBook: json["preBook"],
      catId: json["catId"],
      facId: json["facId"],
      promoPercent: json["promoPercent"],
      image: json["image"],
      image2: json["image2"],
      image3: json["image3"],
      ordsCount: json["ords_count"],
      facility: Facility.fromMap(json["facility"]),
      extras: List<dynamic>.from(json["extras"].map((x) => x)),
      counter: json["counter"],
      imageCount: json["imageCount"],
      mealCat:
          List<MealCat>.from(json["mealCat"].map((x) => MealCat.fromMap(x))),
      favorite: json["favorite"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "titleEn": titleEn,
        "volume": volume,
        "flavors": flavors,
        "calories": calories,
        "description": description,
        "descriptionEn": descriptionEn,
        "price": price,
        "oldPrice": oldPrice,
        "vat": vat,
        "enable": enable,
        "deleted": deleted,
        "preBook": preBook,
        "catId": catId,
        "facId": facId,
        "promoPercent": promoPercent,
        "image": image,
        "image2": image2,
        "image3": image3,
        "ords_count": ordsCount,
        "facility": facility.toMap(),
        "extras": List<dynamic>.from(extras.map((x) => x)),
        "counter": counter,
        "imageCount": imageCount,
        "mealCat": List<dynamic>.from(mealCat.map((x) => x.toMap())),
        "favorite": favorite,
      };
}

class Facility {
  Facility.single({required this.id});
  Facility({
    required this.id,
    required this.ref,
    required this.branches,
    required this.stat,
    required this.arFullName,
    required this.enFullName,
    required this.mainCat,
    required this.subCat,
    required this.supervisorFullName,
    required this.phoneSupervisor,
    required this.emailSupervisor,
    required this.jobSupervisor,
    required this.commercialRegistrationNo,
    required this.taxRegistrationNumber,
    required this.bankName,
    required this.bankAccName,
    required this.ipanNumber,
    required this.bankId,
    required this.morningStartTime,
    required this.morningEndTime,
    required this.eveningStartTime,
    required this.eveningEndTime,
    required this.paymentMethod,
    required this.seating,
    required this.watsApp,
    required this.pickupDetails,
    required this.branchName,
    required this.loyaltySubscription,
    required this.enabled,
    required this.deleted,
    required this.menu,
    required this.hasPromo,
    required this.joinedDate,
    required this.country,
    required this.owner,
    required this.location,
    required this.facType,
    required this.loyalPoints,
    required this.settlement,
    required this.deliveryDet,
    required this.restRate,
    required this.mealsRate,
    required this.commRate,
    required this.distance,
    required this.vatImage,
    required this.taxNumberImage,
    required this.delegationImage,
    required this.facilityImage,
    required this.branchNames,
    required this.mealsAndEmps,
    required this.orderSettings,
    required this.vat,
    required this.morningPeriod,
    required this.eveningPeriod,
    required this.locally,
    required this.takeAway,
    required this.delivery,
    required this.bookTable,
    required this.fav,
  });

  late int? id;
  late String ref;
  late int branches;
  late int stat;
  late String arFullName;
  late String enFullName;
  late String mainCat;
  late String subCat;
  late String supervisorFullName;
  late String phoneSupervisor;
  late String emailSupervisor;
  late dynamic jobSupervisor;
  late String commercialRegistrationNo;
  late String taxRegistrationNumber;
  late String bankName;
  late String bankAccName;
  late String ipanNumber;
  late int bankId;
  late String morningStartTime;
  late String morningEndTime;
  late String eveningStartTime;
  late String eveningEndTime;
  late String paymentMethod;
  late String seating;
  late String watsApp;
  late String pickupDetails;
  late String branchName;
  late bool loyaltySubscription;
  late bool enabled;
  late bool deleted;
  late bool menu;
  late bool hasPromo;
  late DateTime joinedDate;
  late Country country;
  late Owner owner;
  late Location location;
  late FacType facType;
  late LoyalPoints loyalPoints;
  late Settlement settlement;
  late DeliveryDet deliveryDet;
  late double restRate;
  late double mealsRate;
  late double commRate;
  late dynamic distance;
  late dynamic vatImage;
  late dynamic taxNumberImage;
  late dynamic delegationImage;
  late dynamic facilityImage;
  late dynamic branchNames;
  late dynamic mealsAndEmps;
  late dynamic orderSettings;
  late bool vat;
  late bool morningPeriod;
  late bool eveningPeriod;
  late bool locally;
  late bool takeAway;
  late bool delivery;
  late bool bookTable;
  late bool fav;

  factory Facility.fromMap(Map<String, dynamic> json) => Facility(
        id: json["id"],
        ref: json["ref"],
        branches: json["branches"],
        stat: json["stat"],
        arFullName: json["arFullName"],
        enFullName: json["enFullName"],
        mainCat: json["mainCat"],
        subCat: json["subCat"],
        supervisorFullName: json["supervisorFullName"],
        phoneSupervisor: json["phoneSupervisor"],
        emailSupervisor: json["emailSupervisor"],
        jobSupervisor: json["jobSupervisor"],
        commercialRegistrationNo: json["commercialRegistrationNo"],
        taxRegistrationNumber: json["taxRegistrationNumber"],
        bankName: json["bankName"],
        bankAccName: json["bankAccName"],
        ipanNumber: json["ipanNumber"],
        bankId: json["bankId"],
        morningStartTime: json["morningStartTime"],
        morningEndTime: json["morningEndTime"],
        eveningStartTime: json["eveningStartTime"],
        eveningEndTime: json["eveningEndTime"],
        paymentMethod: json["paymentMethod"],
        seating: json["seating"],
        watsApp: json["watsApp"],
        pickupDetails: json["pickupDetails"],
        branchName: json["branchName"],
        loyaltySubscription: json["loyaltySubscription"],
        enabled: json["enabled"],
        deleted: json["deleted"],
        menu: json["menu"],
        hasPromo: json["hasPromo"],
        joinedDate: DateTime.parse(json["joinedDate"]),
        country: Country.fromMap(json["country"]),
        owner: Owner.fromMap(json["owner"]),
        location: Location.fromMap(json["location"]),
        facType: FacType.fromMap(json["facType"]),
        loyalPoints: LoyalPoints.fromMap(json["loyalPoints"]),
        settlement: Settlement.fromMap(json["settlement"]),
        deliveryDet: DeliveryDet.fromMap(json["deliveryDet"]),
        restRate: json["restRate"],
        mealsRate: json["mealsRate"],
        commRate: json["commRate"],
        distance: json["distance"],
        vatImage: json["vatImage"],
        taxNumberImage: json["taxNumberImage"],
        delegationImage: json["delegationImage"],
        facilityImage: json["facilityImage"],
        branchNames: json["branchNames"],
        mealsAndEmps: json["mealsAndEmps"],
        orderSettings: json["orderSettings"],
        vat: json["vat"],
        morningPeriod: json["morningPeriod"],
        eveningPeriod: json["eveningPeriod"],
        locally: json["locally"],
        takeAway: json["takeAway"],
        delivery: json["delivery"],
        bookTable: json["bookTable"],
        fav: json["fav"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ref": ref,
        "branches": branches,
        "stat": stat,
        "arFullName": arFullName,
        "enFullName": enFullName,
        "mainCat": mainCat,
        "subCat": subCat,
        "supervisorFullName": supervisorFullName,
        "phoneSupervisor": phoneSupervisor,
        "emailSupervisor": emailSupervisor,
        "jobSupervisor": jobSupervisor,
        "commercialRegistrationNo": commercialRegistrationNo,
        "taxRegistrationNumber": taxRegistrationNumber,
        "bankName": bankName,
        "bankAccName": bankAccName,
        "ipanNumber": ipanNumber,
        "bankId": bankId,
        "morningStartTime": morningStartTime,
        "morningEndTime": morningEndTime,
        "eveningStartTime": eveningStartTime,
        "eveningEndTime": eveningEndTime,
        "paymentMethod": paymentMethod,
        "seating": seating,
        "watsApp": watsApp,
        "pickupDetails": pickupDetails,
        "branchName": branchName,
        "loyaltySubscription": loyaltySubscription,
        "enabled": enabled,
        "deleted": deleted,
        "menu": menu,
        "hasPromo": hasPromo,
        "joinedDate": joinedDate.toIso8601String(),
        "country": country.toMap(),
        "owner": owner.toMap(),
        "location": location.toMap(),
        "facType": facType.toMap(),
        "loyalPoints": loyalPoints.toMap(),
        "settlement": settlement.toMap(),
        "deliveryDet": deliveryDet.toMap(),
        "restRate": restRate,
        "mealsRate": mealsRate,
        "commRate": commRate,
        "distance": distance,
        "vatImage": vatImage,
        "taxNumberImage": taxNumberImage,
        "delegationImage": delegationImage,
        "facilityImage": facilityImage,
        "branchNames": branchNames,
        "mealsAndEmps": mealsAndEmps,
        "orderSettings": orderSettings,
        "vat": vat,
        "morningPeriod": morningPeriod,
        "eveningPeriod": eveningPeriod,
        "locally": locally,
        "takeAway": takeAway,
        "delivery": delivery,
        "bookTable": bookTable,
        "fav": fav,
      };
}

class Country {
  Country({
    required this.id,
    required this.nameAr,
    required this.name,
    required this.alpha2,
    required this.curr,
    required this.currArr,
    required this.currCode,
    required this.code,
    required this.vat,
    required this.payMethod,
    required this.timeZone,
    required this.bank,
  });

  final int id;
  final String nameAr;
  final String name;
  final String alpha2;
  final String curr;
  final String currArr;
  final String currCode;
  final String code;
  final double vat;
  final String payMethod;
  final int timeZone;
  final List<Bank> bank;

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json["id"],
        nameAr: json["nameAr"],
        name: json["name"],
        alpha2: json["alpha2"],
        curr: json["curr"],
        currArr: json["currArr"],
        currCode: json["currCode"],
        code: json["code"],
        vat: json["vat"]?.toDouble(),
        payMethod: json["payMethod"],
        timeZone: json["timeZone"],
        bank: List<Bank>.from(json["bank"].map((x) => Bank.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nameAr": nameAr,
        "name": name,
        "alpha2": alpha2,
        "curr": curr,
        "currArr": currArr,
        "currCode": currCode,
        "code": code,
        "vat": vat,
        "payMethod": payMethod,
        "timeZone": timeZone,
        "bank": List<dynamic>.from(bank.map((x) => x.toMap())),
      };
}

class Bank {
  Bank({
    required this.id,
    required this.name,
    required this.code,
  });

  final int id;
  final String name;
  final String code;

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class DeliveryDet {
  DeliveryDet({
    required this.id,
    required this.restDlv,
    required this.appDlv,
    required this.free,
    required this.notFreeOrder,
    required this.noDeduct,
    required this.maxDistance,
    required this.inDistCost,
    required this.outDistCost,
    required this.minInDistInvAmount,
    required this.minOutDistInvAmount,
    required this.deductibleAmount,
    required this.minInvAmountFullDeduct,
  });

  final int id;
  final bool restDlv;
  final bool appDlv;
  final bool free;
  final bool notFreeOrder;
  final bool noDeduct;
  final double maxDistance;
  final double inDistCost;
  final double outDistCost;
  final double minInDistInvAmount;
  final double minOutDistInvAmount;
  final double deductibleAmount;
  final double minInvAmountFullDeduct;

  factory DeliveryDet.fromMap(Map<String, dynamic> json) => DeliveryDet(
        id: json["id"],
        restDlv: json["restDlv"],
        appDlv: json["appDlv"],
        free: json["free"],
        notFreeOrder: json["notFreeOrder"],
        noDeduct: json["noDeduct"],
        maxDistance: json["maxDistance"],
        inDistCost: json["inDistCost"],
        outDistCost: json["outDistCost"],
        minInDistInvAmount: json["minInDistInvAmount"],
        minOutDistInvAmount: json["minOutDistInvAmount"],
        deductibleAmount: json["deductibleAmount"],
        minInvAmountFullDeduct: json["minInvAmountFullDeduct"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "restDlv": restDlv,
        "appDlv": appDlv,
        "free": free,
        "notFreeOrder": notFreeOrder,
        "noDeduct": noDeduct,
        "maxDistance": maxDistance,
        "inDistCost": inDistCost,
        "outDistCost": outDistCost,
        "minInDistInvAmount": minInDistInvAmount,
        "minOutDistInvAmount": minOutDistInvAmount,
        "deductibleAmount": deductibleAmount,
        "minInvAmountFullDeduct": minInvAmountFullDeduct,
      };
}

class FacType {
  FacType({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory FacType.fromMap(Map<String, dynamic> json) => FacType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class Location {
  Location({
    required this.id,
    required this.descp,
    required this.locationLat,
    required this.locationLong,
  });

  final int id;
  final String descp;
  final double locationLat;
  final double locationLong;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        id: json["id"],
        descp: json["descp"],
        locationLat: json["locationLat"]?.toDouble(),
        locationLong: json["locationLong"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descp": descp,
        "locationLat": locationLat,
        "locationLong": locationLong,
      };
}

class LoyalPoints {
  LoyalPoints({
    required this.id,
    required this.ptsPerCash,
    required this.cashPerPts,
    required this.enabled,
  });

  final int id;
  final double ptsPerCash;
  final double cashPerPts;
  final bool enabled;

  factory LoyalPoints.fromMap(Map<String, dynamic> json) => LoyalPoints(
        id: json["id"],
        ptsPerCash: json["ptsPerCash"],
        cashPerPts: json["cashPerPts"]?.toDouble(),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ptsPerCash": ptsPerCash,
        "cashPerPts": cashPerPts,
        "enabled": enabled,
      };
}

class Owner {
  Owner({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.job,
    required this.govId,
    required this.prev,
    required this.theOwner,
    required this.lang,
    required this.oneSignalId,
    required this.demo,
    required this.country,
  });

  final int id;
  final String fullName;
  final String phone;
  final String email;
  final String job;
  final dynamic govId;
  final dynamic prev;
  final bool theOwner;
  final String lang;
  final String oneSignalId;
  final bool demo;
  final Country country;

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        id: json["id"],
        fullName: json["fullName"],
        phone: json["phone"],
        email: json["email"],
        job: json["job"],
        govId: json["govId"],
        prev: json["prev"],
        theOwner: json["theOwner"],
        lang: json["lang"],
        oneSignalId: json["oneSignalId"],
        demo: json["demo"],
        country: Country.fromMap(json["country"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "job": job,
        "govId": govId,
        "prev": prev,
        "theOwner": theOwner,
        "lang": lang,
        "oneSignalId": oneSignalId,
        "demo": demo,
        "country": country.toMap(),
      };
}

class Settlement {
  Settlement({
    required this.id,
    required this.payEvery,
    required this.expDate,
  });

  final int id;
  final int payEvery;
  final DateTime expDate;

  factory Settlement.fromMap(Map<String, dynamic> json) => Settlement(
        id: json["id"],
        payEvery: json["payEvery"],
        expDate: DateTime.parse(json["expDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "payEvery": payEvery,
        "expDate":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
      };
}

class MealCat {
  MealCat({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.facId,
    required this.enabled,
    required this.deleted,
  });

  final int id;
  final String name;
  final String nameEn;
  final int facId;
  final bool enabled;
  final bool deleted;

  factory MealCat.fromMap(Map<String, dynamic> json) => MealCat(
        id: json["id"],
        name: json["name"],
        nameEn: json["nameEn"] ?? "",
        facId: json["facId"],
        enabled: json["enabled"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "nameEn": nameEn,
        "facId": facId,
        "enabled": enabled,
        "deleted": deleted,
      };
}
