import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:orderstage/core/app_constant/app_urls.dart';
import 'package:orderstage/core/error/exceptions.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';

abstract class BranchesAndMealRemoteData {
  Future<List<MealModel>> getMeals({required token});
  Future<List<Facility>> getBranches({required token});

  Future<CopyMealModel> postMealsCopy({
    required token,
    required List<int> mealIds,
  });
  Future<CopyMealModel> postMealsCopyToFac({
    required token,
    required List<int> mealIds,
    required int facilityId,
  });
  Future<CopyMealModel> postMealsCopyToAll({
    required token,
    required List<int> mealIds,
    required int facilityId,
    required List<int> facilitiesIdToCopyTo,
    required bool all,
  });
}

class BranchesAndMealsRemoteDataImp extends GetConnect
    implements BranchesAndMealRemoteData {
  @override
  Future<List<MealModel>> getMeals({required token}) async {
    if (token == null) {
      throw EmptyCacheException();
    }

    final response = await get(
      AppUrls.getMealsURL,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return mealModelFromMap(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      return Future.delayed(
        Duration.zero,
        () => getMeals(token: token),
      );
    }
  }

  @override
  Future<List<Facility>> getBranches({required token}) async {
    if (token == null) {
      throw EmptyCacheException();
    }

    final response = await get(
      AppUrls.getBranchesURL,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return facilityModelFromMap(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      return Future.delayed(
        Duration.zero,
        () => getBranches(token: token),
      );
    }
  }

  @override
  Future<CopyMealModel> postMealsCopy({
    required token,
    required List<int> mealIds,
  }) async {
    final CopyMealModel data = CopyMealModel(
      mealIds: mealIds,
    );

    final response = await post(
      AppUrls.postCopy,
      data.toMap(),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    final responseBody = response.body;

    if (response.statusCode == 200) {
      return CopyMealModel.fromMap(responseBody);
    } else if (response.statusCode == 403) {
      throw UnauthorizedException();
    } else {
      return throw OtherException();
    }
  }

  @override
  Future<CopyMealModel> postMealsCopyToAll({
    required token,
    required List<int> mealIds,
    required int facilityId,
    required List<int> facilitiesIdToCopyTo,
    required bool all,
  }) async {
    final CopyMealModel data = CopyMealModel(
      mealIds: mealIds,
      facilityId: facilityId,
      facilitiesIdToCopyTo: facilitiesIdToCopyTo,
      all: all,
    );

    final response = await post(
      AppUrls.postCopyToAll,
      data.toMap(),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    ).timeout(const Duration(seconds: 30));

    final responseBody = response.body;

    if (response.statusCode == 200) {
      return CopyMealModel.fromMap(responseBody);
    } else if (response.statusCode == 403) {
      throw UnauthorizedException();
    } else {
      return Future.delayed(
        const Duration(seconds: 1),
        () => postMealsCopyToAll(
          token: token,
          mealIds: mealIds,
          facilitiesIdToCopyTo: facilitiesIdToCopyTo,
          facilityId: facilityId,
          all: all,
        ),
      );
    }
  }

  @override
  Future<CopyMealModel> postMealsCopyToFac({
    required token,
    required List<int> mealIds,
    required int facilityId,
  }) async {
    final CopyMealModel data =
        CopyMealModel(mealIds: mealIds, facId: facilityId);

    final response = await post(
      AppUrls.postCopyToFac,
      data.toMap(),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    final responseBody = response.body;

    if (response.statusCode == 200) {
      return copyMealModelFromMap(responseBody);
    } else if (response.statusCode == 403) {
      throw UnauthorizedException();
    } else {
      return throw OtherException();
    }
  }
}
