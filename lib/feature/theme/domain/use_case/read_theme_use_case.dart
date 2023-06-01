import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';
import 'package:orderstage/feature/theme/domain/repo/dynamic_theme_repo.dart';

class ReadThemeUseCase {
  final ThemeRepositoryImp themeRepositoryImp;

  ReadThemeUseCase({required this.themeRepositoryImp});

  Future<Either<Failure, ThemeModel>> call() async {
    return await themeRepositoryImp.readData();
  }
}
