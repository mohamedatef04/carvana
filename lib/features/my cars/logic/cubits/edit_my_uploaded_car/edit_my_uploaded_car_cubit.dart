import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/my%20cars/logic/repos/my_cars_repo.dart';
import 'package:equatable/equatable.dart';

part 'edit_my_uploaded_car_state.dart';

class EditMyUploadedCarCubit extends Cubit<EditMyUploadedCarState> {
  EditMyUploadedCarCubit(this.myCarsRepo) : super(EditMyUploadedCarInitial());

  final MyCarsRepo myCarsRepo;

  Future<void> editMyUploadedCars({
    required CarModel carModel,
    required String carId,
  }) async {
    try {
      await myCarsRepo.editMyUploadedCars(carModel: carModel, carId: carId);
      emit(EditMyUploadedCarSuccess());
    } on Exception catch (e) {
      emit(EditMyUploadedCarFailure(errorMessage: e.toString()));
    }
  }
}
