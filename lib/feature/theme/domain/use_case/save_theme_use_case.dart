import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';
import 'package:orderstage/feature/theme/domain/repo/theme_repo.dart';

class SaveThemeUseCase {
  final ThemeRepository themeRepositoryImp;

  SaveThemeUseCase({required this.themeRepositoryImp});

  Future<Either<Failure, Unit>> call({
    required Color primaryColor,
    required Color secondaryColor,
    required Color drawerBackgroundColor,
    required Color backgroundColor,
    required Color bottomBarColor,
    required Color unselectedItemColor,
    required Color selectedItemColor,
  }) async {
    return await themeRepositoryImp.writeData(
      themeModel: ThemeModel(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        drawerBackgroundColor: drawerBackgroundColor,
        backgroundColor: backgroundColor,
        bottomBarColor: bottomBarColor,
        unselectedItemColor: unselectedItemColor,
        selectedItemColor: selectedItemColor,
      ),
    );
  }
}
