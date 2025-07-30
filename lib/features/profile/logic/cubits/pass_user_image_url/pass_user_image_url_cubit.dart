import 'package:bloc/bloc.dart';
import 'package:carvana/features/profile/logic/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'pass_user_image_url_state.dart';

class PassUserImageUrlCubit extends Cubit<PassUserImageUrlState> {
  PassUserImageUrlCubit(this.profileRepo) : super(PassUserImageUrlInitial());

  final ProfileRepo profileRepo;

  Future<void> passUserImageUrl({required String imageUrl}) async {
    try {
      await profileRepo.passUserImageUrl(imageUrl: imageUrl);
      emit(PassUserImageUrlSuccess());
    } on Exception catch (e) {
      emit(PassUserImageUrlFailure(errorMessage: e.toString()));
    }
  }
}
