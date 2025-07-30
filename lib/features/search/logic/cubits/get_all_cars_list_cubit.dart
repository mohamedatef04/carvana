import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/search/logic/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_cars_list_state.dart';

class GetSearchedCarsListCubit extends Cubit<GetSearchedCarsListState> {
  GetSearchedCarsListCubit(this.searchRepo)
    : super(GetSearchedCarsListInitial());

  final SearchRepo searchRepo;

  Future<void> getAllCarsList({required String carName}) async {
    emit(GetSearchedCarsListEmptyState());
    final result = await searchRepo.getSearchedCars(carName: carName);
    result.fold(
      (l) =>
          emit(GetSearchedCarsListFailureState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetSearchedCarsListEmptyState());
        } else {
          emit(GetSearchedCarsListLoadedState(carsList: r));
        }
      },
    );
  }
}
