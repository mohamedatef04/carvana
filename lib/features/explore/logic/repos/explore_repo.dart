import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepo {
  Future<Either<Failures, List<CarModel>>> getAllCars();
}
