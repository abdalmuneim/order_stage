import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class PostMealCopyToFacUseCase {
  final BranchesAndMealsRepository mealRepositoryImp;

  PostMealCopyToFacUseCase({required this.mealRepositoryImp});

  Future<Either<Failure, CopyMealModel>> call({
    required List<int> mealIds,
    required String mealTitle,
    required int facId,
  }) async {
    return await mealRepositoryImp.postMealsCopyToFac(
      mealIds: mealIds,
      facId: facId,
    );
  }
}
