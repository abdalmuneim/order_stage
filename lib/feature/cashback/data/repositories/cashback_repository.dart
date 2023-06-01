import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/app_constant/app_urls.dart';
import 'package:orderstage/core/error/failure.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';

abstract class CashbackRepository {
  Future<Either<Failure, CashbackModel>> getAllCashback();
  Future<Either<Failure, String>> deleteCoupon({required int id});
  Future<Either<Failure, CashbackModel>> getCashbackFacId({required int facId});
  Future<Either<Failure, CashbackModel>> addCashback({
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, CashbackModel>> editCashback({
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, CashbackModel>> enableCashback({
    required Map<String, dynamic> data,
  });
}

class CashbackRepositoryImp extends GetConnect implements CashbackRepository {
  /// get all cashback
  @override
  Future<Either<Failure, CashbackModel>> getAllCashback() async {
    String url = AppUrls.getAllCoupons;

    try {
      final response = await get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      if (response.statusCode == 200) {
        return Right(CashbackModel.fromJson(responseBody));
      } else {
        return const Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => getAllCashback(),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// add cashback
  @override
  Future<Either<Failure, CashbackModel>> addCashback(
      {required Map<String, dynamic> data}) async {
    String url = AppUrls.addCoupon;

    print(data);

    try {
      final response = await post(
        url,
        data,
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      print(responseBody);
      if (response.statusCode == 200) {
        return Right(CashbackModel.fromJson(responseBody));
      } else {
        return const Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => addCashback(data: data),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, CashbackModel>> getCashbackFacId(
      {required int facId}) async {
    String url = AppUrls.getFacIDCoupon;

    try {
      final response = await get(
        "$url/$facId",
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      if (response.statusCode == 200) {
        return Right(CashbackModel.fromJson(responseBody));
      } else if (responseBody == null) {
        return Future.delayed(
          const Duration(seconds: 5),
          () => getCashbackFacId(facId: facId),
        );
      }
      return const Left(ServerFailure(message: "Server Error"));
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => getCashbackFacId(facId: facId),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, CashbackModel>> editCashback(
      {required Map<String, dynamic> data}) async {
    String url = AppUrls.updateCoupon;

    print(data);

    try {
      final response = await put(
        url,
        data,
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      print(responseBody);
      if (responseBody["status"]) {
        return Right(CashbackModel.fromJson(responseBody));
      } else {
        return const Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => editCashback(data: data),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> deleteCoupon({required int id}) async {
    String url = AppUrls.deleteCouponId;

    try {
      final response = await delete(
        "$url/$id",
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      if (response.statusCode == 200) {
        return Right(CashbackModel.fromJson(responseBody).message!);
      }
      return const Left(ServerFailure(message: "Server Error"));
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => deleteCoupon(id: id),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, CashbackModel>> enableCashback(
      {required Map<String, dynamic> data}) async {
    String url = AppUrls.updateCoupon;

    print(data);

    try {
      final response = await put(
        url,
        data,
        headers: {
          'Accept': 'application/json',
        },
      );
      final responseBody = response.body;
      print(responseBody);
      if (response.statusCode == 200) {
        return Right(CashbackModel.fromJson(responseBody));
      } else {
        return const Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException {
      return Future.delayed(
        const Duration(seconds: 5),
        () => enableCashback(data: data),
      );
    } catch (e) {
      rethrow;
    }
  }
}
