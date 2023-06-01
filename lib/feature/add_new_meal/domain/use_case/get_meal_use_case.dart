import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class GetMealUseCase {
  final BranchesAndMealsRepository mealRepositoryImp;

  GetMealUseCase({required this.mealRepositoryImp});

  Future<Either<Failure, List<MealModel>>> call() async {
    return await mealRepositoryImp.getMeals();
  }
}
