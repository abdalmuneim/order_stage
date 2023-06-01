import 'package:get/get.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';
import 'package:orderstage/feature/cashback/data/repositories/cashback_repository.dart';

class CurrentCashbackController extends GetxController {
  final CashbackRepository _cashbackRepositoryImp;

  CurrentCashbackController(this._cashbackRepositoryImp);

  final RxList<CashbackData> _currentCashback = <CashbackData>[].obs;
  RxList<CashbackData> get currentCashback => _currentCashback;

  getCashbackFacId() async {
    final result = await _cashbackRepositoryImp.getCashbackFacId(facId: 16751);
    result.fold((l) {
      ToastManager.showError(l.message);
    }, (CashbackModel r) {
      _currentCashback.value = r.data ?? <CashbackData>[];
    });
    update();
  }

  goToEdit(CashbackData cashbackData) {
    Get.toNamed(Routes.editCashback, arguments: {
      "cashback": cashbackData,
    });
  }

  @override
  void onInit() async {
    await getCashbackFacId();
    super.onInit();
  }

  deleteCoupon(int id) async {
    final result = await _cashbackRepositoryImp.deleteCoupon(id: id);
    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      ToastManager.showSuccess(r);
      getCashbackFacId();
    });
  }

  final RxBool _enabled = false.obs;
  RxBool get enabled => _enabled;
  onChangeEnableCashback(CashbackData cashback) async {
    _enabled.value = !_enabled.value;
    await enableCoupon(cashback, _enabled.value);
    getCashbackFacId();
  }

  enableCoupon(CashbackData cashback, bool enable) async {
    List<int> facId = [];
    facId.add(cashback.facilityId!);

    final data = CashbackData(
      id: cashback.id,
      startDate: cashback.startDate,
      endDate: cashback.endDate,
      withCoupon: cashback.withCoupon,
      coupon: cashback.coupon,
      totalLimit: cashback.totalLimit,
      specific: cashback.specific,
      phoneNumber: cashback.phoneNumber,
      oneTimeUse: cashback.oneTimeUse,
      facilityIds: facId,
      // facilityId: cashback.facilityId,
      enabled: enable,
      description: cashback.description,
      percentage: cashback.percentage,
      updateAll: false,
    ).toJson();

    final result = await _cashbackRepositoryImp.enableCashback(data: data);
    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      ToastManager.showSuccess(r.message!);
    });
  }
}
