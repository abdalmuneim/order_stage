import 'package:dartz/dartz.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class GetBranchesUseCase {
  final BranchesAndMealsRepository branchesRepositoryImp;

  GetBranchesUseCase({required this.branchesRepositoryImp});

  Future<Either<Failure, List<Facility>>> call() async {
    return await branchesRepositoryImp.getBranches();
  }
}
