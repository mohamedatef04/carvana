import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/my%20cars/logic/repos/my_cars_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCarsRepoImpl implements MyCarsRepo {
  final ApiService apiService;

  MyCarsRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<CarModel>>> showMyUploadedCars() async {
    try {
      final res = await apiService.getRequest(endpoint: carsTable);

      List<dynamic> jsonData = res.data;
      List<CarModel> allCars = [];
      List<CarModel> myUploadedCars = [];

      for (var car in jsonData) {
        allCars.add(CarModel.fromJson(car));
      }

      for (var car in allCars) {
        if (car.sellerId == Supabase.instance.client.auth.currentUser?.id) {
          myUploadedCars.add(car);
        } else {
          myUploadedCars.remove(car);
        }
      }
      return right(myUploadedCars);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> editMyUploadedCars({
    required CarModel carModel,
    required String carId,
  }) async {
    try {
      await apiService.updateRequest(
        endpoint: '$carsTable?car_id=eq.$carId',
        data: {
          'seller_name': carModel.sellerName,
          'seller_email': carModel.sellerEmail,
          'seller_address': carModel.sellerAddress,
          'seller_phone': carModel.sellerPhone,
          'car_brand': carModel.carBrand,
          'car_status': carModel.carStatus,
          'car_description': carModel.carDescription,
          'car_capacity': carModel.carCapacity,
          'car_model': carModel.carModel,
          'car_transmission_type': carModel.carTransmission,
          'car_engine': carModel.carEngine,
          'car_max_speed': carModel.carMaxSpeed,
          'car_fuel': carModel.carFuel,
          'car_number_of_litres': carModel.carNumberOfLitresBer100Km,
          'car_manufucture_year': carModel.carManufuctureYear,
          'car_color': carModel.carColor,
          'car_price': carModel.carPrice,
          'car_number_of_sylenders': carModel.carNumberOfSylenders,
          'available_for_rent': carModel.availableForRent,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      }
      throw ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<void> deleteMyUploadedCar({required String carId}) async {
    try {
      await apiService.deleteRequest(endpoint: '$carsTable?car_id=eq.$carId');
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      }
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
