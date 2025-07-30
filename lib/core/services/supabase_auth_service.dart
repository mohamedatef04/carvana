import 'package:carvana/core/errors/custom_exeption.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<User> createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase.auth.signUp(email: email, password: password);
      return user.user!;
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return user.user!;
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw CustomExeption(errorMessage: e.message);
    } catch (e) {
      throw const CustomExeption(errorMessage: 'something went wrong');
    }
  }

  Future<bool> isSignedIn() async {
    if (supabase.auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
