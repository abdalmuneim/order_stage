import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';

import 'data/selected_copy_option_enum.dart';

class SaveOptionsController extends GetxController {
  RxBool showProgress = false.obs;

  final _multiSelectMealsKey = GlobalKey<FormFieldState>();

  Rx<SelectedCopyOptionEnum> selectedCopyOption = SelectedCopyOptionEnum.na.obs;
  GlobalKey<FormFieldState> get multiSelectMealKey => _multiSelectMealsKey;

  final _multiSelectBranchesKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> get multiSelectBranchesKey =>
      _multiSelectBranchesKey;

  final RxList<MealModel> _selectedMeals = <MealModel>[].obs;
  RxList<MealModel> get selectedMeals => _selectedMeals;

  late final RxList<MultiSelectItem<MealModel>> _itemsMeal =
      <MultiSelectItem<MealModel>>[].obs;
  RxList<MultiSelectItem<MealModel>> get itemsMeals => _itemsMeal;

  final RxList<Facility> _selectedBranches = <Facility>[].obs;
  RxList<Facility> get selectedBranches => _selectedBranches;

  late final RxList<MultiSelectItem<Facility>> _itemsBranch =
      <MultiSelectItem<Facility>>[].obs;
  RxList<MultiSelectItem<Facility>> get itemsBranches => _itemsBranch;

  selectedMealsList(List<MealModel> meal) {
    _selectedMeals.value = meal;
    log('selected list: $_selectedMeals');
  }

  selectedBranchesList(List<Facility> meal) {
    _selectedBranches.value = meal;
    log('selected list: $_selectedBranches');
  }

  /* 
  Future getBranches(int facId) async {
    try {
      showProgress.value = true;
      final response = await springDio.get('facility/getBranches/$facId');
      itemsBranches.value = List.generate(response.data.length,
          (index) => Facility.fromJson2(response.data[index])).map((e) {
        String name = e.branches > 0 ? e.branchName : e.arFullName;
        if (e.branches > 0) {
          name = name.split("<BR>")[0];
        } else {
          name = Get.locale!.languageCode == 'en' ? e.enFullName : e.arFullName;
        }
        showProgress.value = false;

        return MultiSelectItem(e, name);
      }).toList();
      showProgress.value = false;

      return response.data;
    } on Exception catch (e) {
      log(e.toString());
      showProgress.value = false;

      return [];
    }
  }
 */
}
