class UserModel {
  String? message;
  bool? status;
  int? code;
  Data? data;
  String? accessToken;
  String? refreshToken;

  UserModel(
      {this.message,
      this.status,
      this.code,
      this.data,
      this.accessToken,
      this.refreshToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class Data {
  String? username;
  String? oneSignalId;
  String? lang;
  bool? active;
  bool? verified;
  List<Roles>? roles;
  Driver? driver;

  Data(
      {this.username,
      this.oneSignalId,
      this.lang,
      this.active,
      this.verified,
      this.roles,
      this.driver});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    oneSignalId = json['oneSignalId'];
    lang = json['lang'];
    active = json['active'];
    verified = json['verified'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['oneSignalId'] = this.oneSignalId;
    data['lang'] = this.lang;
    data['active'] = this.active;
    data['verified'] = this.verified;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Driver {
  String? email;
  String? city;
  String? licenceNumber;
  String? idNumber;
  String? phone;
  String? name;
  String? nationality;
  String? folderPath;
  int? deliveryRange;
  int? driverId;
  String? driverStatus;
  List<String>? deliveryPoint;
  List<String>? orderPoint;
  String? location;
  DriverBanks? driverBanks;
  Countries? countries;
  Car? car;

  Driver(
      {this.email,
      this.city,
      this.licenceNumber,
      this.idNumber,
      this.phone,
      this.name,
      this.nationality,
      this.folderPath,
      this.deliveryRange,
      this.driverId,
      this.driverStatus,
      this.deliveryPoint,
      this.orderPoint,
      this.location,
      this.driverBanks,
      this.countries,
      this.car});

  Driver.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    city = json['city'];
    licenceNumber = json['licenceNumber'];
    idNumber = json['idNumber'];
    phone = json['phone'];
    name = json['name'];
    nationality = json['nationality'];
    folderPath = json['folderPath'];
    deliveryRange = json['deliveryRange'];
    driverId = json['driverId'];
    driverStatus = json['driverStatus'];
    deliveryPoint = json['deliveryPoint'].cast<String>();
    orderPoint = json['orderPoint'].cast<String>();
    location = json['location'];
    driverBanks = json['driverBanks'] != null
        ? new DriverBanks.fromJson(json['driverBanks'])
        : null;
    countries = json['countries'] != null
        ? new Countries.fromJson(json['countries'])
        : null;
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['city'] = this.city;
    data['licenceNumber'] = this.licenceNumber;
    data['idNumber'] = this.idNumber;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['nationality'] = this.nationality;
    data['folderPath'] = this.folderPath;
    data['deliveryRange'] = this.deliveryRange;
    data['driverId'] = this.driverId;
    data['driverStatus'] = this.driverStatus;
    data['deliveryPoint'] = this.deliveryPoint;
    data['orderPoint'] = this.orderPoint;
    data['location'] = this.location;
    if (this.driverBanks != null) {
      data['driverBanks'] = this.driverBanks!.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    if (this.car != null) {
      data['car'] = this.car!.toJson();
    }
    return data;
  }
}

class DriverBanks {
  Bank? bank;
  String? accountName;
  String? refNo;
  String? iban;

  DriverBanks({this.bank, this.accountName, this.refNo, this.iban});

  DriverBanks.fromJson(Map<String, dynamic> json) {
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    accountName = json['accountName'];
    refNo = json['refNo'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['accountName'] = this.accountName;
    data['refNo'] = this.refNo;
    data['iban'] = this.iban;
    return data;
  }
}

class Bank {
  String? code;
  String? name;
  String? refNo;

  Bank({this.code, this.name, this.refNo});

  Bank.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    refNo = json['refNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['refNo'] = this.refNo;
    return data;
  }
}

class Countries {
  int? id;
  String? nameAr;
  String? nameEn;
  String? alpha;
  String? code;
  String? currEn;
  String? currArr;
  String? payMethod;
  String? currCode;
  int? timeZone;
  String? flag;
  int? vat;
  String? refNo;
  String? bankRespDto;

  Countries(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.alpha,
      this.code,
      this.currEn,
      this.currArr,
      this.payMethod,
      this.currCode,
      this.timeZone,
      this.flag,
      this.vat,
      this.refNo,
      this.bankRespDto});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    alpha = json['alpha'];
    code = json['code'];
    currEn = json['currEn'];
    currArr = json['currArr'];
    payMethod = json['payMethod'];
    currCode = json['currCode'];
    timeZone = json['timeZone'];
    flag = json['flag'];
    vat = json['vat'];
    refNo = json['refNo'];
    bankRespDto = json['bankRespDto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['alpha'] = this.alpha;
    data['code'] = this.code;
    data['currEn'] = this.currEn;
    data['currArr'] = this.currArr;
    data['payMethod'] = this.payMethod;
    data['currCode'] = this.currCode;
    data['timeZone'] = this.timeZone;
    data['flag'] = this.flag;
    data['vat'] = this.vat;
    data['refNo'] = this.refNo;
    data['bankRespDto'] = this.bankRespDto;
    return data;
  }
}

class Car {
  CarModelDto? carModelDto;
  String? refNo;
  String? color;
  String? carPlateNo;
  String? year;

  Car({this.carModelDto, this.refNo, this.color, this.carPlateNo, this.year});

  Car.fromJson(Map<String, dynamic> json) {
    carModelDto = json['carModelDto'] != null
        ? new CarModelDto.fromJson(json['carModelDto'])
        : null;
    refNo = json['refNo'];
    color = json['color'];
    carPlateNo = json['carPlateNo'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carModelDto != null) {
      data['carModelDto'] = this.carModelDto!.toJson();
    }
    data['refNo'] = this.refNo;
    data['color'] = this.color;
    data['carPlateNo'] = this.carPlateNo;
    data['year'] = this.year;
    return data;
  }
}

class CarModelDto {
  String? makeName;
  String? modelName;
  String? refNo;

  CarModelDto({this.makeName, this.modelName, this.refNo});

  CarModelDto.fromJson(Map<String, dynamic> json) {
    makeName = json['makeName'];
    modelName = json['modelName'];
    refNo = json['refNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['makeName'] = this.makeName;
    data['modelName'] = this.modelName;
    data['refNo'] = this.refNo;
    return data;
  }
}
