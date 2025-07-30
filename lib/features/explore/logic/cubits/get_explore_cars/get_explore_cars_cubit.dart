import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/explore/logic/repos/explore_repo.dart';
import 'package:meta/meta.dart';

part 'get_explore_cars_state.dart';

class GetExploreCarsCubit extends Cubit<GetExploreCarsState> {
  GetExploreCarsCubit(this.exploreRepo) : super(GetExploreCarsInitial());

  final ExploreRepo exploreRepo;

  Future<void> getExploreCars({bool forceRefresh = false}) async {
    emit(GetExploreCarsLoadingState());
    final result = await exploreRepo.getAllCars();

    result.fold(
      (l) => emit(GetExploreCarsErrorState(errorMessage: l.errorMessage)),
      (r) => emit(GetExploreCarsLoadedState(carsList: r)),
    );
  }
}
