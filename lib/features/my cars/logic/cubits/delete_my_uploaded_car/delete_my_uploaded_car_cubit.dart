import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/my%20cars/logic/repos/my_cars_repo.dart';
import 'package:equatable/equatable.dart';

part 'delete_my_uploaded_car_state.dart';

class DeleteMyUploadedCarCubit extends Cubit<DeleteMyUploadedCarState> {
  DeleteMyUploadedCarCubit(this.myCarsRepo)
    : super(DeleteMyUploadedCarInitial());

  final MyCarsRepo myCarsRepo;

  Future<void> deleteMyUploadedCar({required String carId}) async {
    try {
      await myCarsRepo.deleteMyUploadedCar(carId: carId);
      emit(DeleteMyUploadedCarSuccess());

      final res = await myCarsRepo.showMyUploadedCars();
      res.fold(
        (l) => emit(DeleteMyUploadedCarFailure(errorMessage: l.errorMessage)),
        (r) {
          if (r.isEmpty) {
            emit(DeleteMyUploadedCarEmpty());
          } else {
            emit(MyUploadedCarsAfterDelete(carsList: r));
          }
        },
      );
    } catch (e) {
      emit(DeleteMyUploadedCarFailure(errorMessage: e.toString()));
    }
  }
}
