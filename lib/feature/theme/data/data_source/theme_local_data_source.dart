import 'package:get_storage/get_storage.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/core/utils/fields.dart';
import 'package:orderstage/feature/theme/data/models/theme_model.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeStorageLocalDataImp {
  Future<Unit> writeData({
    required ThemeModel themeModel,
  });
  Future<ThemeModel> readData();
}

class ThemeStorageLocalData implements ThemeStorageLocalDataImp {
  final _otherBox = GetStorage();

  @override
  Future<ThemeModel> readData() async {
    try {
      final getTheme = await _otherBox.read(Fields.GETTHEMESTORG);

      final ThemeModel data = ThemeModel.fromJson(getTheme ?? "");
      return data;
    } on EmptyCacheFailure {
      throw const EmptyCacheFailure();
    }
  }

  @override
  Future<Unit> writeData({required ThemeModel themeModel}) async {
    try {
      await _otherBox.write(Fields.GETTHEMESTORG, themeModel.toJson());
      return Future.value(unit);
    } on EmptyCacheFailure {
      throw const EmptyCacheFailure();
    }
  }
}
