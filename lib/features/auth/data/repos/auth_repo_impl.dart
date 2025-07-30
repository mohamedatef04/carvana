import 'package:carvana/core/errors/custom_exeption.dart';
import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/core/services/supabase_auth_service.dart';
import 'package:carvana/features/auth/data/models/user_model.dart';
import 'package:carvana/features/auth/logic/repos/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  final ApiService apiService;

  AuthRepoImpl(this.supabaseAuthService, this.apiService);
  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      final user = await supabaseAuthService.createAccountWithEmailAndPassword(
        email: email,
        password: password,
      );
      storeUserData(userModel: userModel);

      return user;
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await supabaseAuthService.resetPassword(email: email);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> storeUserData({required UserModel userModel}) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;

    if (userId == null) {
      throw Exception("User ID is null. Make sure the user is signed in.");
    }
    String token = await FirebaseMessaging.instance.getToken() ?? '';
    try {
      await apiService.postRequest(
        endpoint: usersTable,
        data: {
          'id': userId,
          'user_first_name': userModel.firstName,
          'user_last_name': userModel.lastName,
          'user_email': userModel.email,
          'user_phone': userModel.phone,
          'user_address': userModel.address,
          'fcm_token': token,
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
}
