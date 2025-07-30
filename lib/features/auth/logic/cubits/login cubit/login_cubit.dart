import 'package:bloc/bloc.dart';
import 'package:carvana/core/errors/custom_exeption.dart';
import 'package:carvana/features/auth/logic/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on CustomExeption catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
