import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/get_branches_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/get_meal_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_to_all_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_to_fac_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_use_case.dart';

class ChoosesDataController extends GetxController {
  final GetMealUseCase _getMealUseCase;
  final GetBranchesUseCase _getBranchesUseCase;
  final PostMealCopyToAllUseCase _postMealCopyToAllUseCase;
  final PostMealCopyToFacUseCase _postMealCopyToFacUseCase;
  final PostMealCopyUseCase _postMealCopyUseCase;

  ChoosesDataController(
      this._getMealUseCase,
      this._getBranchesUseCase,
      this._postMealCopyToAllUseCase,
      this._postMealCopyToFacUseCase,
      this._postMealCopyUseCase);
  RxBool isLoad = false.obs;
  RxBool isLoadSendSave = false.obs;
  RxBool isLoadSendSaveCopy = false.obs;
  final _multiSelectMealsKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> get multiSelectMealKey => _multiSelectMealsKey;

  final _multiSelectBranchesKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> get multiSelectBranchesKey =>
      _multiSelectBranchesKey;

  final RxList<MealModel> _selectedMeals = <MealModel>[].obs;
  RxList<MealModel> get selectedMeals => _selectedMeals;

  late RxList<MultiSelectItem<MealModel>> _itemsMeal;
  RxList<MultiSelectItem<MealModel>> get itemsMeals => _itemsMeal;

  final RxList<Facility> _selectedBranches = <Facility>[].obs;
  RxList<Facility> get selectedBranches => _selectedBranches;

  late RxList<MultiSelectItem<Facility>> _itemsBranch;
  RxList<MultiSelectItem<Facility>> get itemsBranches => _itemsBranch;

  selectedMealsList(List<MealModel> meal) {
    _selectedMeals.value = meal;
  }

  selectedBranchesList(List<Facility> meal) {
    _selectedBranches.value = meal;
  }

  Future<List<MealModel>> getMeals() async {
    isLoad.value = true;
    List<MealModel> list = [];
    var response = await _getMealUseCase();
    isLoad.value = false;

    response.fold((l) {
      ToastManager.showError(l.message);
    }, (List<MealModel> r) async {
      return list = r;
    });
    update();
    return list;
  }

  Future<List<Facility>> getBranches() async {
    List<Facility> list = [];
    isLoad.value = true;

    var response = await _getBranchesUseCase();
    isLoad.value = false;

    response.fold((l) {
      ToastManager.showError(l.message);
    }, (List<Facility> r) async {
      return list = r;
    });
    update();
    return list;
  }

  postMealCopy() async {
    List<int> mealIDs = [];

    for (var element in _selectedMeals) {
      mealIDs.add(element.id);
    }
    isLoadSendSave.value = true;
    final result = await _postMealCopyUseCase(
      mealIds: mealIDs,
    );
    isLoadSendSave.value = false;

    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      ToastManager.showSuccess(r.message ?? "");
    });
  }

  postMealCopyToFac() async {
    isLoadSendSave.value = true;
    List<int> mealIDs = [];

    for (var element in _selectedMeals) {
      mealIDs.add(element.id);
    }
    final result = await _postMealCopyToFacUseCase(
      mealIds: mealIDs,
      mealTitle: _selectedMeals.first.title,
      facId: _selectedBranches.first.id!,
    );
    isLoadSendSave.value = false;

    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) {
      ToastManager.showSuccess(r.message ?? "");
    });
  }

  postMealCopyToAll() async {
    List<int> branchIDs = [];
    List<int> mealIDs = [];
    isLoadSendSaveCopy.value = true;

    for (var element in _selectedBranches) {
      branchIDs.add(element.id!);
    }
    for (var element in _selectedMeals) {
      mealIDs.add(element.id);
    }
    final result = await _postMealCopyToAllUseCase(
      mealIds: mealIDs,
      facilityId: _selectedMeals.first.facility.id!,
      facilitiesIdToCopyTo: branchIDs,
      all: false,
    );
    isLoadSendSaveCopy.value = false;

    result.fold((l) {
      ToastManager.showError(l.message);
    }, (CopyMealModel r) {
      ToastManager.showSuccess(r.message!);
    });
  }

  backClick() {
    Get.back();
  }

  @override
  void onInit() async {
    await getMeals().then((value) => _itemsMeal = value
        .map((meal) =>
            MultiSelectItem<MealModel>(meal, '${meal.title}\n${meal.code}'))
        .toList()
        .obs);

    await getBranches().then((value) => _itemsBranch = value
        .map((branch) => MultiSelectItem<Facility>(
            branch, '${branch.branchName.split('<BR>')[0]}\n${branch.id}'))
        .toList()
        .obs);

    super.onInit();
  }
}
