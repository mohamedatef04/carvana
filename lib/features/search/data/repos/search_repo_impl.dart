import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/search/logic/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<CarModel>>> getSearchedCars({
    required String carName,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: carsTable);
      List<dynamic> jsonData = res.data;
      List<CarModel> allCars = [];
      List<CarModel> searchedCars = [];
      for (var car in jsonData) {
        allCars.add(CarModel.fromJson(car));
      }

      for (var car in allCars) {
        if (car.carModel.toLowerCase().contains(carName.toLowerCase())) {
          searchedCars.add(car);
        } else {
          searchedCars.remove(car);
        }
      }
      return right(searchedCars);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
