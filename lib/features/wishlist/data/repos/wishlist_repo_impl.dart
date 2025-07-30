import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WishlistRepoImpl implements WishlistRepo {
  final ApiService apiService;
  WishlistRepoImpl({required this.apiService});
  @override
  Future<void> addToWishlist({required String carId}) async {
    try {
      await apiService.postRequest(
        endpoint: favoriteCarsTable,
        data: {
          'for_user': Supabase.instance.client.auth.currentUser?.id,
          'for_car': carId,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<Either<Failures, List<CarModel>>> getWishlistCars() async {
    try {
      final res = await apiService.getRequest(
        endpoint: allCarsWithfavoritesEndpoint,
      );
      List<dynamic> jsonData = res.data;
      List<CarModel> allWishlistCars = jsonData
          .map((e) => CarModel.fromJson(e))
          .toList();
      final userId = Supabase.instance.client.auth.currentUser?.id;
      final wishlistCarsForSpecificUser = allWishlistCars.where((car) {
        final favs = car.favCars;
        return favs != null && favs.any((x) => x['for_user'] == userId);
      }).toList();

      return Right(wishlistCarsForSpecificUser);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> removeFromWishlist({
    required String carId,
  }) async {
    try {
      await apiService.deleteRequest(
        endpoint:
            '$favoriteCarsTable?for_user=eq.${Supabase.instance.client.auth.currentUser?.id}&for_car=eq.$carId',
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
