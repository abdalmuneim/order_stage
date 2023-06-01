import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/data/repositories/apps_repository.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/apps_controller.dart';

class AddAppController extends GetxController {
  final AppsRepository _appsRepositoryImp;
  AddAppController(this._appsRepositoryImp);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;

  final RxList<Meals> _selectedMeals = <Meals>[].obs;
  RxList<Meals> get selectedMeals => _selectedMeals;

  final RxList<Meals> _itemsMeal = <Meals>[].obs;
  RxList<Meals> get itemsMeals => _itemsMeal;

  final appName = Rx(TextEditingController());
  final percentage = Rx(TextEditingController(text: '0.0'));

  final RxBool _isAlreadyExists = false.obs;
  RxBool get isAlreadyExists => _isAlreadyExists;

  addApp() async {
    if (_selectedMeals.isEmpty) {
      return;
    }
    if (_globalKey.currentState!.validate()) {
      isLoadingButton.value = true;

      final result = await _appsRepositoryImp.postApp(
        facilityId: 16751,
        appName: appName.value.text,
        percentage: double.parse(percentage.value.text),
        meals: _selectedMeals,
      );
      isLoadingButton.value = false;
      result.fold((l) {
        ToastManager.showError(l.message, color: Colors.red);
      }, (r) {
        Get.find<AppsController>().getApps();
        Get.back();
        ToastManager.showSuccess('add app Succeeded', color: Colors.green);
      });
    } else {
      ToastManager.showSuccess('Make Sure All Field', color: Colors.red);
    }
  }

  onChangeAppName(String value) {
    _isAlreadyExists.value = Get.find<AppsController>()
        .checkAppIsAlreadyExists(
          value,
        )
        .value;
    update();
  }

  selectedMealsList(Meals? meal) {
    if (meal != null) {
      if (isSelected(meal.id)) {
        _selectedMeals.removeWhere((element) => element.id == meal.id);
      } else {
        _selectedMeals.add(meal);
      }
    } else {}

    update();
  }

  isSelected(int? id) {
    final bool result = _selectedMeals.any((element) => element.id == id);
    return result;
  }

  List<Meals> _addPercentageOnPrice() {
    Map<String, dynamic> toMapMeal = {};

    for (Meals e in _selectedMeals) {
      toMapMeal = e.toMap();

      toMapMeal['price'] = double.parse(((e.oldPrice!) +
              (e.oldPrice! * double.parse(percentage.value.text)) / 100)
          .toStringAsFixed(2));

      final data = _selectedMeals[
              _selectedMeals.indexWhere((element) => element.id == e.id)] =
          Meals.fromMap(toMapMeal);
      print(data);
      update();
    }
    return _selectedMeals;
  }

  clearFields() {
    appName.value.clear();
    percentage.value.clear();
  }

  cancelSelect() {
    _selectedMeals.clear();
  }

  @override
  void onInit() {
    _itemsMeal.value = Get.find<AppsController>().itemsMeals;

    super.onInit();
  }

  @override
  void onClose() {
    clearFields();
    super.onClose();
  }
}
