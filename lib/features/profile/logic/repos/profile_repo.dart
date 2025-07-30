import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserDataModel>> getUserData();
  Future<void> passUserImageUrl({required String imageUrl});
}
