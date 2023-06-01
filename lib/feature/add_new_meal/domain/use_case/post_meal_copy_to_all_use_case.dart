import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class PostMealCopyToAllUseCase {
  final BranchesAndMealsRepository mealRepositoryImp;

  PostMealCopyToAllUseCase({required this.mealRepositoryImp});

  Future<Either<Failure, CopyMealModel>> call({
    required List<int> mealIds,
    required int facilityId,
    required List<int> facilitiesIdToCopyTo,
    required bool all,
  }) async {
    return await mealRepositoryImp.postMealsCopyToAll(
      mealIds: mealIds,
      facilityIdId: facilityId,
      facilitiesIdToCopyTo: facilitiesIdToCopyTo,
      all: all,
    );
  }
}
