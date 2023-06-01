import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';

abstract class BranchesAndMealsRepository {
  Future<Either<Failure, List<MealModel>>> getMeals();
  Future<Either<Failure, List<Facility>>> getBranches();
  Future<Either<Failure, CopyMealModel>> postMealsCopy({
    required List<int> mealIds,
  });
  Future<Either<Failure, CopyMealModel>> postMealsCopyToFac({
    required List<int> mealIds,
    required int facId,
  });
  Future<Either<Failure, CopyMealModel>> postMealsCopyToAll({
    required List<int> mealIds,
    required int facilityIdId,
    required List<int> facilitiesIdToCopyTo,
    required bool all,
  });
}
