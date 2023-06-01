import 'package:get/get.dart';
import 'package:orderstage/feature/add/prisentations/bindings/add_binding.dart';
import 'package:orderstage/feature/add/prisentations/views/add_view.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/prisentations/bindings/add_app_binding.dart';
import 'package:orderstage/feature/add_app/prisentations/bindings/apps_binding.dart';
import 'package:orderstage/feature/add_app/prisentations/bindings/edit_app_binding.dart';
import 'package:orderstage/feature/add_app/prisentations/views/add_app_view.dart';
import 'package:orderstage/feature/add_app/prisentations/views/edit_app_view.dart';
import 'package:orderstage/feature/add_app/prisentations/views/apps_view.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/bindings/add_new_meal_binding.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/bindings/chooses_data_binding.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/views/add_new_meal_view.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/views/chooses_data_view.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/bindings/bottom_bar_binding.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/bindings/main_bar_binding.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/views/bottom_bar_view.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';
import 'package:orderstage/feature/cashback/prisentations/bindings/cashback_binding.dart';
import 'package:orderstage/feature/cashback/prisentations/bindings/current_cashback_bindind.dart';
import 'package:orderstage/feature/cashback/prisentations/bindings/edit_cashback_binding.dart';
import 'package:orderstage/feature/cashback/prisentations/pages/add_cashback_page.dart';
import 'package:orderstage/feature/cashback/prisentations/pages/current_cashback_page.dart';
import 'package:orderstage/feature/cashback/prisentations/pages/edit_cashback_page.dart';
import 'package:orderstage/feature/local_auth/prisentations/bindings/local_auth_binding.dart';
import 'package:orderstage/feature/local_auth/prisentations/pages/local_auth_pages.dart';
import 'package:orderstage/feature/printer/prisentation/views/printers_view.dart';
import 'package:orderstage/feature/printer/prisentation/bindings/print_binding.dart';
import 'package:orderstage/feature/printer/prisentation/views/printer_setting_view.dart';
import 'package:orderstage/feature/splash/prisentations/bindings/splash_bindings.dart';
import 'package:orderstage/feature/splash/prisentations/views/splash_view.dart';
import 'package:orderstage/feature/theme/presintations/bindings/theme_binding.dart';
import 'package:orderstage/feature/theme/presintations/view/theme_view.dart';
part 'string_routes.dart';

class AppPages {
  AppPages._();

  static String initial = Routes.localAuth;

  /// initial rout

  static final routes = [
    /// splash page
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    /// bottom page
    GetPage(
      name: _Paths.bottom,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
      bindings: [
        /// main bar page
        MainBarBinding(),
      ],
    ),

    /// theme
    GetPage(
      name: _Paths.theme,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
    ),

    /// new add new meal in branches
    GetPage(
      name: _Paths.newMeal,
      page: () => const AddNewMealView(),
      binding: AddNewMealBinding(),
    ),

    /// new add new meal in branches

    GetPage(
      name: _Paths.newMealChoosesData,
      page: () => const ChoosesDataView(),
      binding: ChoosesDataBinding(),
    ),

    /// add
    GetPage(
      name: Routes.add,
      page: () => const AddPage(),
      binding: AddBinding(),
    ),

    /// apps
    GetPage(
        name: Routes.apps,
        page: () => const AppsView(),
        binding: AppsBinding()),

    /// add  app
    GetPage(
      name: Routes.addApp,
      page: () => const AddAppView(),
      binding: AddAppBinding(),
    ),

    /// edit app
    GetPage(
      arguments: AppModel,
      name: Routes.editApp,
      page: () => const EditAppView(),
      binding: EditAppBinding(),
    ),

    /// print
    GetPage(
      name: Routes.printerSetting,
      page: () => const PrinterSettingView(),
      binding: PrinterSettingBinding(),
    ),

    /// printers
    GetPage(
        name: Routes.printers,
        arguments: bool,
        page: () {
          final arg = Get.arguments;
          print(arg);
          return PrintersView(
            isBluetooth: arg["isBlue"],
            devices: arg["devices"],
          );
        },
        binding: PrinterSettingBinding()),

    /// cashback
    GetPage(
      name: Routes.cashback,
      page: () {
        return const CashbackPage();
      },
      binding: CashbackBinding(),
    ),

    /// current_cashback
    GetPage(
      name: Routes.currentCashback,
      page: () => const CurrentCashbackPage(),
      binding: CurrentCashbackBinding(),
    ),

    /// edit cashback
    GetPage(
      arguments: CashbackData,
      name: Routes.editCashback,
      page: () {
        final arg = Get.arguments;
        print(arg);
        return EditCashbackPage(
          cashback: arg["cashback"],
        );
      },
      binding: EditCashbackBinding(),
    ),

    /// local auth
    GetPage(
      name: Routes.localAuth,
      page: () => const LocalAuthPage(),
      binding: LocalAuthBinding(),
    ),
  ];
}
