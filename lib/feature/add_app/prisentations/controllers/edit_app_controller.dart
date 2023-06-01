import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/data/repositories/apps_repository.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/apps_controller.dart';

class EditAppController extends GetxController {
  final AppsRepository _appsRepositoryImp;
  EditAppController(this._appsRepositoryImp);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  RxBool isLoading = false.obs;

  final RxList<Meals> _selectedMeals = <Meals>[].obs;
  RxList<Meals> get selectedMeals => _selectedMeals;

  final RxList<Meals> _itemsMeal = <Meals>[].obs;
  RxList<Meals> get itemsMeals => _itemsMeal;

  final Rx<TextEditingController> _appName = TextEditingController().obs;
  Rx<TextEditingController> get appName => _appName;
  final RxString _title = ''.obs;
  RxString get title => _title;

  final Rx<TextEditingController> _percentage =
      TextEditingController(text: '0.0').obs;
  Rx<TextEditingController> get percentage => _percentage;

  // late double _lastPercentage;
  late int _id;
  late int _facId;
  final RxBool _isAlreadyExists = false.obs;
  RxBool get isAlreadyExists => _isAlreadyExists;

  editApp() async {
    _title.value = appName.value.text;
    if (_selectedMeals.isEmpty) {
      return;
    }
    if (_globalKey.currentState!.validate()) {
      final double editPercentage = double.parse(percentage.value.text);

      isLoading.value = true;
      final result = await _appsRepositoryImp.editApp(
        id: _id,
        facilityId: _facId,
        appName: appName.value.text,
        percentage: editPercentage,
        meals: _selectedMeals,
      );
      isLoading.value = false;
      result.fold((l) {
        ToastManager.showError(l.message, color: Colors.red);
      }, (r) {
        Get.find<AppsController>().getApps();
        Get.back();
        ToastManager.showSuccess('edit app Succeeded', color: Colors.green);
      });
    } else {
      ToastManager.showError('edit app error', color: Colors.red);
    }
  }

  onChangeAppName(String value) {
    _isAlreadyExists.value = Get.find<AppsController>()
        .checkAppIsAlreadyExists(value, title: _title.value)
        .value;

    print(isAlreadyExists);
    update();
  }

  selectedMealsList(Meals? meal) {
    if (meal != null) {
      if (isSelected(meal.id)) {
        _selectedMeals.removeWhere((element) => element.id == meal.id);
      } else {
        _selectedMeals.add(meal);
      }
    } else {
      ToastManager.showError("قائمة الةجبات فارغة المحالوله لاحقا",
          color: Colors.red);
    }
  }

  isSelected(int? id) {
    final bool result = _selectedMeals.any((element) => element.id == id);
    return result;
  }

  removeApp() {
    Get.find<AppsController>()
        .appsList
        .removeWhere((element) => element.id == _id);
    _selectedMeals.clear();

    Get.back();
    Get.back();
  }

  clearFields() {
    _appName.value.clear();
    _percentage.value.clear();
  }

  @override
  void onInit() async {
    _title.value = Get.arguments['appName'];
    _id = Get.arguments['id'];
    _facId = Get.arguments['facId'];
    _selectedMeals.value = mealModelFromMap(Get.arguments['meals']);
    _appName.value.text = Get.arguments['appName'];
    _percentage.value.text = Get.arguments['percentage'].toString();
    _itemsMeal.value = Get.find<AppsController>().itemsMeals;
    super.onInit();
  }

  @override
  void onClose() {
    clearFields();
    super.onClose();
  }
}
