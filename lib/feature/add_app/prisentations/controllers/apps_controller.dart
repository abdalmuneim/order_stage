import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/core/routes/routes.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/data/repositories/apps_repository.dart';

class AppsController extends GetxController {
  final AppsRepository _appsRepositoryImp;
  AppsController(this._appsRepositoryImp);

  RxBool isLoading = false.obs;

  final RxList<AppModel> _appsList = <AppModel>[].obs;
  RxList<AppModel> get appsList => _appsList;

  final RxList<Meals> _itemsMeal = <Meals>[].obs;
  RxList<Meals> get itemsMeals => _itemsMeal;

  Future<List<AppModel>> getApps() async {
    isLoading.value = true;

    final result = await _appsRepositoryImp.getAllApps(facID: 16751);
    isLoading.value = false;
    result.fold((Failure l) {
      ToastManager.showError(l.message);
    }, (List<AppModel> r) {
      _appsList.value = r;
    });
    return _appsList;
  }

  goToAddApp() {
    Get.toNamed(
      Routes.addApp,
    );
  }

  goToAddAppEdit(AppModel addAppModel) {
    Get.toNamed(
      Routes.editApp,
      arguments: addAppModel.toMap(),
    );
  }

  Future<List<Meals>> _getMeals() async {
    isLoading.value = true;
    Either<Failure, List<Meals>> response = await _appsRepositoryImp.getMeals();
    isLoading.value = false;
    response.fold((l) {
      ToastManager.showError(l.message);
    }, (List<Meals> r) {
      _itemsMeal.value = r;
    });
    return _itemsMeal;
  }

  RxBool _isAlreadyExists = false.obs;
  RxBool checkAppIsAlreadyExists(String appName, {String? title}) {
    _isAlreadyExists = appsList
        .any(
          (element) => element.appName == appName && element.appName != title,
        )
        .obs;
    update();
    return _isAlreadyExists;
  }

  @override
  void onInit() async {
    await getApps();
    await _getMeals();
    super.onInit();
  }
}
