import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/my%20cars/logic/repos/my_cars_repo.dart';
import 'package:equatable/equatable.dart';

part 'my_uploaded_cars_state.dart';

class MyUploadedCarsCubit extends Cubit<MyUploadedCarsState> {
  MyUploadedCarsCubit(this.myCarsRepo) : super(MyUploadedCarsInitial());

  final MyCarsRepo myCarsRepo;

  Future<void> getMyUploadedCars() async {
    emit(MyUploadedCarsLoading());
    final result = await myCarsRepo.showMyUploadedCars();

    result.fold(
      (l) => emit(MyUploadedCarsError(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(MyUploadedCarsEmpty());
        } else {
          emit(MyUploadedCarsLoaded(carsList: r));
        }
      },
    );
  }

  Future<void> deleteMyUploadedCar({required String carId}) async {
    emit(MyUploadedCarsLoading());
    try {
      await myCarsRepo.deleteMyUploadedCar(carId: carId);
      emit(DeleteMyUploadedCarSuccess());

      final res = await myCarsRepo.showMyUploadedCars();
      res.fold(
        (l) => emit(MyUploadedCarsError(errorMessage: l.errorMessage)),
        (r) {
          if (r.isEmpty) {
            emit(MyUploadedCarsEmpty());
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
