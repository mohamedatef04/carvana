import 'dart:io';
import 'package:carvana/features/profile/logic/cubits/user_image/user_image_state.dart';
import 'package:carvana/features/profile/logic/repos/user_image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserImageCubit extends Cubit<UserImageState> {
  final UserImageRepo userImageRepo;

  UserImageCubit(this.userImageRepo) : super(UserImageInitial());

  Future<void> uploadImage(File imageFile) async {
    emit(UserImageUploading());
    try {
      final imageUrl = await userImageRepo.uploadUserImage(imageFile);
      emit(UserImageUploadSuccess(imageUrl));
    } catch (e) {
      emit(UserImageUploadFailure(e.toString()));
    }
  }
}
