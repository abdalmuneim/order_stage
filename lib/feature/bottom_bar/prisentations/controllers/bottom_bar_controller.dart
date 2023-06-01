import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/views/main_bar.dart';
import 'package:orderstage/feature/theme/presintations/controller/dynamic_theme_controller.dart';
import 'package:orderstage/injection.dart';

class BottomBarController extends GetxController {
  BottomBarController();

  final List<Widget> _pages = [
    const MainBar(),
    Scaffold(body: Center(child: Text(AppStrings.myOrder))),
    const Scaffold(body: Center()),
    Scaffold(body: Center(child: Text(AppStrings.basket))),
    Scaffold(body: Center(child: Text(AppStrings.notifications))),
  ];
  List<Widget> get pages => _pages;

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_work_outlined),
      label: AppStrings.main,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.restaurant),
      label: AppStrings.myOrder,
    ),
    const BottomNavigationBarItem(
      icon: Text(''),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_cart_checkout_sharp),
      label: AppStrings.basket,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.notifications),
      label: AppStrings.notifications,
    ),
  ];
  List<BottomNavigationBarItem> get items => _items;

  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    if (index == 2) {
      return;
    }
    _selectedIndex.value = index;
    update();
  }

  @override
  void onInit() {
    Get.put(DynamicThemeController(sl()));
    super.onInit();
  }
}
