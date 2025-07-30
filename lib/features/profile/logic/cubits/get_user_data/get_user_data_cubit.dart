import 'package:bloc/bloc.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_state.dart';
import 'package:carvana/features/profile/logic/repos/profile_repo.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.profileRepo) : super(GetUserDataInitial());

  final ProfileRepo profileRepo;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final res = await profileRepo.getUserData();

    res.fold((l) => emit(GetUserDataFailure(errorMessage: l.errorMessage)), (
      r,
    ) {
      emit(GetUserDataSuccess(userDataModel: r));
    });
  }
}
