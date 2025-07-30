import 'package:carvana/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  });

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> resetPassword({required String email});

  Future<void> storeUserData({required UserModel userModel});
}
