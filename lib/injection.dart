import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:orderstage/core/utils/bluetooth_info.dart';
import 'package:orderstage/core/utils/fields.dart';
import 'package:orderstage/core/utils/network_info.dart';
import 'package:orderstage/feature/add_app/data/repositories/apps_repository.dart';
import 'package:orderstage/feature/add_new_meal/data/data_sourece/remote_data_sources.dart';
import 'package:orderstage/feature/add_new_meal/data/repositories/branches_meals_repository_impl.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/get_branches_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/get_meal_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_to_all_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_to_fac_use_case.dart';
import 'package:orderstage/feature/add_new_meal/domain/use_case/post_meal_copy_use_case.dart';
import 'package:orderstage/feature/cashback/data/repositories/cashback_repository.dart';
import 'package:orderstage/feature/theme/data/data_source/theme_local_data_source.dart';
import 'package:orderstage/feature/theme/data/repo/theme_repo.dart';
import 'package:orderstage/feature/theme/domain/repo/theme_repo.dart';
import 'package:orderstage/feature/theme/domain/use_case/read_theme_use_case.dart';

import 'package:orderstage/feature/theme/domain/use_case/save_theme_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///--------------  FEATURE -----------------------
  /// Use cases
  sl.registerLazySingleton(() => SaveThemeUseCase(themeRepositoryImp: sl()));
  sl.registerLazySingleton(() => ReadThemeUseCase(themeRepositoryImp: sl()));
  sl.registerLazySingleton(() => GetMealUseCase(mealRepositoryImp: sl()));
  sl.registerLazySingleton(
      () => GetBranchesUseCase(branchesRepositoryImp: sl()));
  sl.registerLazySingleton(
      () => PostMealCopyToAllUseCase(mealRepositoryImp: sl()));
  sl.registerLazySingleton(
      () => PostMealCopyToFacUseCase(mealRepositoryImp: sl()));
  sl.registerLazySingleton(() => PostMealCopyUseCase(mealRepositoryImp: sl()));

  /// Repository
  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepoImp(themeStorageLocalDataImp: sl()));

  sl.registerLazySingleton<AppsRepository>(() => AppsRepositoryImp());

  sl.registerLazySingleton<BranchesAndMealsRepository>(
      () => BranchesAndMealDataRepoImpl(sl()));
  sl.registerLazySingleton<CashbackRepository>(() => CashbackRepositoryImp());
  // sl.registerLazySingleton<AppsRepository>(() => AppsRepositoryImp());

  /// Data sources

  //remote source
  sl.registerLazySingleton<BranchesAndMealRemoteData>(
      () => BranchesAndMealsRemoteDataImp());
  // Local sources
  sl.registerLazySingleton<ThemeStorageLocalDataImp>(
      () => ThemeStorageLocalData());

  ///! Core

  //! External

  await GetStorage.init(Fields.GETTHEMESTORG);
  await GetStorage.init(Fields.NETWORKPRINTER);
  await GetStorage.init(Fields.DEFAULTPRINTER);
  GetStorage.init();
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<BluetoothInfo>(
      () => BluetoothInfoImp(blueConnectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
  sl.registerLazySingleton(() => FlutterBluePlus.instance);
}
