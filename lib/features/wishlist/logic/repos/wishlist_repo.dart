import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo {
  Future<void> addToWishlist({required String carId});
  Future<Either<Failures, List<CarModel>>> getWishlistCars();
  Future<Either<Failures, void>> removeFromWishlist({required String carId});
}
