import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<CarModel>>> getRecentlyAddedCars();
  Future<Either<Failures, List<CarModel>>> getCarsForEachBrand({
    required String brandName,
  });

  Future<Either<Failures, UserDataModel>> getCarSellerImage({
    required String userId,
  });
}
