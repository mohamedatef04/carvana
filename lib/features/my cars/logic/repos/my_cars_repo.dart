import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class MyCarsRepo {
  Future<Either<Failures, List<CarModel>>> showMyUploadedCars();
  Future<void> editMyUploadedCars({
    required CarModel carModel,
    required String carId,
  });

  Future<void> deleteMyUploadedCar({required String carId});
}
