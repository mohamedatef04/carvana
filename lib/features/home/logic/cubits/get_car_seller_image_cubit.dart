import 'package:bloc/bloc.dart';
import 'package:carvana/features/home/logic/repos/home_repo.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

part 'get_car_seller_image_state.dart';

class GetCarSellerImageCubit extends Cubit<GetCarSellerImageState> {
  GetCarSellerImageCubit(this.homeRepo) : super(GetCarSellerImageInitial());

  final HomeRepo homeRepo;

  Future<void> getCarSellerImage({required String userId}) async {
    final result = await homeRepo.getCarSellerImage(userId: userId);
    result.fold(
      (l) => emit(GetCarSellerImageFailure(errorMessage: l.errorMessage)),
      (r) => emit(GetCarSellerImageSuccess(userDataModel: r)),
    );
  }
}
