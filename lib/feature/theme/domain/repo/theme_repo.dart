import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';
import 'package:orderstage/feature/theme/domain/entities/theme_entities.dart';

abstract class ThemeRepository {
  Future<Either<Failure, Unit>> writeData({
    required ThemeModel themeModel,
  });
  Future<Either<Failure, ThemeEntities>> readData();
}
