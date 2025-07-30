import 'package:bloc/bloc.dart';
import 'package:carvana/features/auth/data/models/user_model.dart';
import 'package:carvana/features/auth/logic/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    emit(SignUpLoading());
    try {
      await authRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
        userModel: userModel,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }
}
