import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/sell%20car/logic/repos/upload_car_repo.dart';
import 'package:equatable/equatable.dart';

part 'upload_car_state.dart';

class UploadCarCubit extends Cubit<UploadCarState> {
  UploadCarCubit(this.uploadCarRepo) : super(UploadCarInitial());

  final UploadCarRepo uploadCarRepo;

  Future<void> uploadCar({required CarModel carModel}) async {
    emit(UploadCarLoading());
    try {
      await uploadCarRepo.uploadCar(carModel: carModel);
      emit(UploadCarSuccess());
    } catch (e) {
      emit(UploadCarFailure(e.toString()));
    }
  }
}
