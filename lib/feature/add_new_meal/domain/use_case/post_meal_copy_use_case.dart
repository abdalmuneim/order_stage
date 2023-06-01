import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class PostMealCopyUseCase {
  final BranchesAndMealsRepository mealRepositoryImp;

  PostMealCopyUseCase({required this.mealRepositoryImp});

  Future<Either<Failure, CopyMealModel>> call({
    required List<int> mealIds,
  }) async {
    return await mealRepositoryImp.postMealsCopy(mealIds: mealIds);
  }
}
