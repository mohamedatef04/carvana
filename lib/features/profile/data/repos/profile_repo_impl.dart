import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:carvana/features/profile/logic/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, UserDataModel>> getUserData() async {
    try {
      final res = await apiService.getRequest(endpoint: usersTable);

      List<dynamic> jsonData = res.data;
      List<UserDataModel> allUsers = [];
      List<UserDataModel> specificUser = [];
      for (var user in jsonData) {
        allUsers.add(UserDataModel.fromJson(user));
      }
      for (var user in allUsers) {
        if (user.id == Supabase.instance.client.auth.currentUser?.id) {
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

  @override
  Future<void> passUserImageUrl({required String imageUrl}) async {
    try {
      await apiService.updateRequest(
        endpoint:
            '$usersTable?id=eq.${Supabase.instance.client.auth.currentUser?.id}',
        data: {'user_image_url': imageUrl},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
