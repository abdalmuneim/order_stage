import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';

abstract class ThemeRepositoryImp {
  Future<Either<Failure, ThemeModel>> readData();
}
