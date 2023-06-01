import 'package:get/get.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/feature/theme/presintations/controller/dynamic_theme_controller.dart';
import 'package:orderstage/injection.dart';

class MainBarController extends GetxController {
  final Rx<int> _selectedButton = 0.obs;
  int get selectedButton => _selectedButton.value;

  final Rx<String> _selectedFilter = Rx(AppStrings.all);
  String get selectedFilter => _selectedFilter.value;
  final Rx<List<String>> _items = Rx([AppStrings.all, '1', '2', '3']);
  List<String> get items => _items.value;

  selectFilter(String? value) {
    _selectedFilter.value = value!;
    update();
  }

  selectButton(int i) {
    _selectedButton.value = i;
    update();
  }

  @override
  void onInit() {
    Get.put(DynamicThemeController(sl()));
    super.onInit();
  }
}
