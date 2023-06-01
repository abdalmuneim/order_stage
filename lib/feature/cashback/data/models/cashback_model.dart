class CashbackModel {
  String? message;
  bool? status;
  int? code;
  List<CashbackData>? data;
  String? date;
  int? deleteMessage;

  CashbackModel(
      {this.message,
      this.status,
      this.code,
      this.data,
      this.date,
      this.deleteMessage});

  CashbackModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      if (json['data'] is int) {
        deleteMessage = json['data'];
      } else {
        data = <CashbackData>[];
        json['data'].forEach((v) {
          data!.add(CashbackData.fromJson(v));
        });
      }
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['date'] = date;
    return data;
  }
}

class CashbackData {
  int? id;
  String? createdAt;
  String? startDate;
  String? description;
  String? endDate;
  bool? withCoupon;
  String? coupon;
  double? totalLimit;
  double? percentage;
  bool? specific;
  String? phoneNumber;
  bool? oneTimeUse;
  List<int>? facilityIds;
  int? facilityId;
  bool? enabled;
  bool? updateAll;

  CashbackData({
    this.id,
    this.facilityId,
    this.createdAt,
    this.startDate,
    this.description,
    this.endDate,
    this.withCoupon,
    this.coupon,
    this.totalLimit,
    this.percentage,
    this.specific,
    this.phoneNumber,
    this.oneTimeUse,
    this.facilityIds,
    this.enabled,
    this.updateAll,
  });

  CashbackData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];

    startDate = json["startDate"];
    description = json['description'];
    endDate = json['endDate'];
    withCoupon = json['withCoupon'];
    coupon = json['coupon'];
    totalLimit = json['totalLimit'] is double
        ? json['totalLimit']
        : json['totalLimit'].toDouble();
    percentage = json['percentage'] is double
        ? json['percentage']
        : json['percentage'].toDouble();
    specific = json['specific'];
    phoneNumber = json['phoneNumber'];
    oneTimeUse = json['oneTimeUse'];
    facilityIds = json['facility_ids'];
    facilityId = json['facility_id'];
    enabled = json['enabled'];
    updateAll = json['updateAll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['startDate'] = startDate;
    data['description'] = description;
    data['endDate'] = endDate;
    data['withCoupon'] = withCoupon;
    data['coupon'] = coupon;
    data['totalLimit'] = totalLimit;
    data['percentage'] = percentage;
    data['specific'] = specific;
    data['phoneNumber'] = phoneNumber;
    data['oneTimeUse'] = oneTimeUse;
    data['facility_ids'] = facilityIds;
    data['facility_id'] = facilityId;
    data['enabled'] = enabled;
    data['updateAll'] = updateAll;
    return data;
  }
}

/*  */
