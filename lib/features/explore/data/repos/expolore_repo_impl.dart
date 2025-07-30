import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/explore/logic/repos/explore_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExpoloreRepoImpl implements ExploreRepo {
  final ApiService apiService;

  ExpoloreRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<CarModel>>> getAllCars() async {
    try {
      final res = await apiService.getRequest(endpoint: carsTable);
      List<dynamic> jsonData = res.data;
      List<CarModel> allCars = [];
      for (var car in jsonData) {
        allCars.add(CarModel.fromJson(car));
      }
      return right(allCars);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
