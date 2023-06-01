import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:orderstage/core/app_constant/app_urls.dart';
import 'package:orderstage/core/error/exceptions.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';

abstract class AppsRepository {
  Future<Either<Failure, List<Meals>>> getMeals();
  Future<Either<Failure, List<AppModel>>> getAllApps({
    required int facID,
  });
  Future<Either<Failure, AppModel>> postApp({
    required int facilityId,
    required String appName,
    required double percentage,
    required List<Meals> meals,
  });
  Future<Either<Failure, AppModel>> editApp({
    required int id,
    required int facilityId,
    required String appName,
    required double percentage,
    required List<Meals> meals,
  });
}

class AppsRepositoryImp extends GetConnect implements AppsRepository {
  @override
  Future<Either<Failure, List<AppModel>>> getAllApps({
    required int facID,
  }) async {
    String? token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';
    String url = "${AppUrls.getAppsUrl}/$facID";

    try {
      final response = await get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;

      if (response.statusCode == 200) {
        return Right(appModelFromMap(responseBody));
      } else {
        throw ServerException(message: 'Server Error');
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => getAllApps(facID: facID),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, AppModel>> postApp({
    required int facilityId,
    required String appName,
    required double percentage,
    required List<Meals> meals,
  }) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    final List mealsIds = [];

    for (var element in meals) {
      mealsIds.add({'id': element.id});
    }

    data['facilityId'] = facilityId;
    data['appName'] = appName;
    data['percentage'] = percentage;
    data['meals'] = mealsIds;

    String? token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';
    try {
      final response = await post(
        AppUrls.addAppUrl,
        data,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      final responseBody = response.body;

      if (response.statusCode == 201) {
        return Right(AppModel.fromMap(responseBody));
      } else {
        return const Left(ServerFailure(message: 'Server Error'));
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 3),
        () => postApp(
          appName: appName,
          percentage: percentage,
          facilityId: facilityId,
          meals: meals,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, AppModel>> editApp({
    required int id,
    required String appName,
    required double percentage,
    required int facilityId,
    required List<Meals> meals,
  }) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    final List mealsIds = [];

    for (var element in meals) {
      mealsIds.add({'id': element.id});
    }
    data['id'] = id;
    data['appName'] = appName;
    data['percentage'] = percentage;
    data['facilityId'] = facilityId;
    data['meals'] = mealsIds;

    String? token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';
    try {
      final response = await post(
        AppUrls.editAppUrl,
        data,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      final responseBody = response.body;

      if (response.statusCode == 200) {
        return Right(AppModel.fromMap(responseBody));
      } else {
        throw ServerException(message: 'Server Error');
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => editApp(
          id: id,
          appName: appName,
          percentage: percentage,
          facilityId: facilityId,
          meals: meals,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Meals>>> getMeals() async {
    String? token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcWM1N20iLCJyb2xlcyI6W10sImlzcyI6Ii9hcGkvbG9naW4iLCJleHAiOjE3NTA1MTM1Mjl9.elXEZSl_4Nwb7sHBL38dosU8rduirOxV9ho-mcm4-mE';

    if (token.isEmpty) {
      throw EmptyCacheException();
    }
    try {
      final response = await get(
        AppUrls.getMealsURL,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return Right(mealModelFromMap(response.body));
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        return Future.delayed(
          Duration.zero,
          () => getMeals(),
        );
      }
    } on ServerException catch (serverException) {
      return Left(ServerFailure(message: serverException.message));
    } on SocketException {
      return const Left(ConnectionFailure());
    } on UnauthorizedException {
      return const Left(UnAuthenticatedFailure());
    }
  }
}
