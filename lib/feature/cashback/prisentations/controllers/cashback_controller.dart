import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/core/helper/save_option_handler.dart';
import 'package:orderstage/core/utils/custom_pic.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/cashback/data/enums/cashback_enum.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';
import 'package:orderstage/feature/cashback/data/repositories/cashback_repository.dart';

class CashbackController extends GetxController {
  final CashbackRepository _cashbackRepositoryImp;

  CashbackController(this._cashbackRepositoryImp);

  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "globalKey");
  GlobalKey<FormState> get globalKey => _globalKey;

  late final GlobalKey<FormState> _globalKeyDialog =
      GlobalKey<FormState>(debugLabel: " globalKeyDialog");
  GlobalKey<FormState> get globalKeyDialog => _globalKeyDialog;

  final titleOfOfferCRT = TextEditingController();
  final couponCRT = TextEditingController();
  final totalLimitCRT = TextEditingController();
  final clintNumberCRT = TextEditingController();
  final percentageCRT = TextEditingController();

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final Rx<DiscountType> _discountType = DiscountType.withCode.obs;
  Rx<DiscountType> get discountType => _discountType;

  final Rx<UseCodeManyTime> _useCodeManyTime = UseCodeManyTime.non.obs;
  Rx<UseCodeManyTime> get useCodeManyTime => _useCodeManyTime;

  final RxBool _forSpecificClient = false.obs;
  RxBool get forSpecificClient => _forSpecificClient;
  final RxBool _updateAll = false.obs;
  RxBool get updateAll => _updateAll;

  final Rx<String> _timeToView = "".obs;
  Rx<String> get timeToView => _timeToView;

  final Rx<String> _timeFromView = "".obs;
  Rx<String> get timeFromView => _timeFromView;

  final Rx<String> _timeTo = "".obs;
  Rx<String> get timeTo => _timeTo;

  final Rx<String> _timeFrom = "".obs;
  Rx<String> get timeFrom => _timeFrom;

  final RxList<int> _facilityIds = <int>[16751].obs;
  RxList<int> get facilityIds => _facilityIds;

  final DateTime _dateTimeNow = DateTime.now();
  DateTime get dateTimeNow => _dateTimeNow;

  onChangeSpecificClient(bool value) {
    _forSpecificClient.value = value;
    useCodeManyTime.value = UseCodeManyTime.non;
  }

  onChangeDateTimeFrom(DateTime value) {
    _timeFrom.value = value.toIso8601String();

    final String date = customFormatDatePic(
      value,
      formatPattern,
      LocaleType.ar,
    );
    _timeFromView.value = date;
  }

  onChangeDateTimeTo(DateTime value) {
    _timeTo.value = value.toIso8601String();
    final String date = customFormatDatePic(
      value,
      formatPattern,
      LocaleType.ar,
    );
    _timeToView.value = date;
  }

  onChangeDiscountType(DiscountType value) {
    _discountType.value = value;
  }

  onChangeUseCodeManyTime(UseCodeManyTime value) {
    _useCodeManyTime.value = value;
    _forSpecificClient.value = false;
  }

  saveCoupon() async {
    if (_globalKey.currentState!.validate()) {
      if (timeFromView.isNotEmpty || timeToView.isNotEmpty) {
        final data = CashbackData(
          startDate: timeFrom.value,
          endDate: timeTo.value,
          withCoupon:
              _discountType.value == DiscountType.withCode ? true : false,
          coupon: couponCRT.text,
          totalLimit: double.parse(totalLimitCRT.text),
          specific: forSpecificClient.value,
          phoneNumber: clintNumberCRT.text,
          oneTimeUse:
              _useCodeManyTime.value == UseCodeManyTime.onlyOne ? true : false,
          facilityIds: facilityIds,
          enabled: false,
          description: titleOfOfferCRT.text,
          percentage: double.parse(percentageCRT.text),
          updateAll: _updateAll.value,
        ).toJson();
        SaveOptionsHandeler.goToSaveOptions(
          data,
          "facilityIds",
          title: "titleLarge",
          callBack: (_) => addCoupon(
            data,
          ),
        );
      }
    }
  }

  addCoupon(Map<String, dynamic> data) async {
    isLoading.value = true;
    final result = await _cashbackRepositoryImp.addCashback(
      data: data,
    );
    isLoading.value = false;
    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      clearData();
      ToastManager.showSuccess(r.message ?? "");
    });
  }

  discountCodeOptions() {
    if (_globalKeyDialog.currentState!.validate()) {
      if (!(useCodeManyTime.value == UseCodeManyTime.non &&
          forSpecificClient.isFalse)) {
        Get.back();
      }
    }
  }

  clearData() {
    titleOfOfferCRT.clear();
    _timeFromView.value = "";
    _timeToView.value = "";
    _timeFrom.value = "";
    _timeTo.value = "";
    totalLimitCRT.clear();
    percentageCRT.clear();
    _useCodeManyTime.value = UseCodeManyTime.non;
    _forSpecificClient.value = false;
    clintNumberCRT.clear();
    couponCRT.clear();
    _discountType.value = DiscountType.withCode;
  }

  getAllCashback() async {
    final result = await _cashbackRepositoryImp.getAllCashback();

    result.fold((Failure l) {
      ToastManager.showError(l.message);
    }, (CashbackModel r) {
      ToastManager.showSuccess(r.message ?? "");
    });
  }

  @override
  void onInit() async {
    // await getAllCashback();
    super.onInit();
  }
}
