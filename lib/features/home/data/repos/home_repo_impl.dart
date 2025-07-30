import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/home/logic/repos/home_repo.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<CarModel>>> getRecentlyAddedCars() async {
    try {
      final res = await apiService.getRequest(
        endpoint: allCarsWithfavoritesEndpoint,
      );
      List<dynamic> jsonData = res.data;
      List<CarModel> recentlyAddedCars = [];
      for (var car in jsonData) {
        recentlyAddedCars.add(CarModel.fromJson(car));
      }
      return right(recentlyAddedCars.take(5).toList());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CarModel>>> getCarsForEachBrand({
    required String brandName,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: carsTable);

      List<dynamic> jsonData = res.data;
      List<CarModel> allCars = [];
      List<CarModel> carsForEachBrand = [];

      for (var car in jsonData) {
        allCars.add(CarModel.fromJson(car));
      }

      for (var car in allCars) {
        if (car.carBrand == brandName) {
          carsForEachBrand.add(car);
        } else {
          carsForEachBrand.remove(car);
        }
      }
      return right(carsForEachBrand);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserDataModel>> getCarSellerImage({
    required String userId,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: usersTable);

      List<dynamic> jsonData = res.data;
      List<UserDataModel> allUsers = [];
      List<UserDataModel> specificUser = [];

      for (var user in jsonData) {
        allUsers.add(UserDataModel.fromJson(user));
      }
      for (var user in allUsers) {
        if (user.id == userId) {
          specificUser.add(user);
        } else {
          specificUser.remove(user);
        }
      }

      return right(specificUser[0]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
