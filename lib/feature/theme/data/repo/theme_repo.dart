import 'package:orderstage/feature/theme/data/data_source/theme_local_data_source.dart';

import 'package:orderstage/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';

import 'package:orderstage/feature/theme/domain/repo/theme_repo.dart';

class ThemeRepoImp implements ThemeRepository {
  final ThemeStorageLocalDataImp themeStorageLocalDataImp;
  ThemeRepoImp({required this.themeStorageLocalDataImp});

  @override
  Future<Either<Failure, ThemeModel>> readData() async {
    try {
      final ThemeModel theme = await themeStorageLocalDataImp.readData();

      return Right(theme);
    } on EmptyCacheFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> writeData(
      {required ThemeModel themeModel}) async {
    try {
      await themeStorageLocalDataImp.writeData(themeModel: themeModel);
      return const Right(unit);
    } on EmptyCacheFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
