import 'package:bloc/bloc.dart';
import 'package:carvana/features/auth/logic/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await authRepo.resetPassword(email: email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(errorMessage: e.toString()));
    }
  }
}
