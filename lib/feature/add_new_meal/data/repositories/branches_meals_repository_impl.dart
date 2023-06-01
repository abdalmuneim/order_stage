import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:orderstage/core/error/exceptions.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_new_meal/data/data_sourece/remote_data_sources.dart';
import 'package:orderstage/feature/add_new_meal/data/models/copy_meal_model.dart';
import 'package:orderstage/feature/add_new_meal/data/models/meal_model.dart';
import 'package:orderstage/feature/add_new_meal/domain/repositories/brances_meals_repo.dart';

class BranchesAndMealDataRepoImpl implements BranchesAndMealsRepository {
  final BranchesAndMealRemoteData branchesAndMealRemoteData;

  BranchesAndMealDataRepoImpl(this.branchesAndMealRemoteData);

  @override
  Future<Either<Failure, List<MealModel>>> getMeals() async {
    try {
      final result = await branchesAndMealRemoteData.getMeals(
        token:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE',
      );

      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, List<Facility>>> getBranches() async {
    try {
      final result = await branchesAndMealRemoteData.getBranches(
        token:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE',
      );

      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, CopyMealModel>> postMealsCopy({
    required List<int> mealIds,
  }) async {
    try {
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';

      final result = await branchesAndMealRemoteData.postMealsCopy(
          token: token, mealIds: mealIds);

      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, CopyMealModel>> postMealsCopyToAll({
    required List<int> mealIds,
    required int facilityIdId,
    required List<int> facilitiesIdToCopyTo,
    required bool all,
  }) async {
    try {
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';

      final result = await branchesAndMealRemoteData.postMealsCopyToAll(
        token: token,
        mealIds: mealIds,
        facilityId: facilityIdId,
        facilitiesIdToCopyTo: facilitiesIdToCopyTo,
        all: all,
      );

      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    } on OtherException {
      return const Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, CopyMealModel>> postMealsCopyToFac({
    required List<int> mealIds,
    required int facId,
  }) async {
    try {
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';

      final result = await branchesAndMealRemoteData.postMealsCopyToFac(
        token: token,
        mealIds: mealIds,
        facilityId: facId,
      );

      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    }
  }
}
