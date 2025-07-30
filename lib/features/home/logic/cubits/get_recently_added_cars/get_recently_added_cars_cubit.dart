import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/home/logic/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_recently_added_cars_state.dart';

class GetRecentlyAddedCarsCubit extends Cubit<GetRecentlyAddedCarsState> {
  GetRecentlyAddedCarsCubit(this.homeRepo)
    : super(GetRecentlyAddedCarsInitial());

  final HomeRepo homeRepo;

  Future<void> getRecentlyAddedCars() async {
    emit(GetRecentlyAddedCarsLoading());
    final result = await homeRepo.getRecentlyAddedCars();

    result.fold(
      (l) => emit(GetRecentlyAddedCarsFailure(errorMessage: l.errorMessage)),
      (r) {
        emit(GetRecentlyAddedCarsSuccess(carsList: r));
      },
    );
  }
}
