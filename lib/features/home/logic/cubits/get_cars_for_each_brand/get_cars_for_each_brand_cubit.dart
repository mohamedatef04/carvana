import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/home/logic/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_cars_for_each_brand_state.dart';

class GetCarsForEachBrandCubit extends Cubit<GetCarsForEachBrandState> {
  GetCarsForEachBrandCubit(this.homeRepo) : super(GetCarsForEachBrandInitial());

  final HomeRepo homeRepo;

  bool hasFetchedBefore = false;

  Future<void> getCarsForEachBrand({required String brandName}) async {
    emit(GetCarsForEachBrandLoadingState());
    final result = await homeRepo.getCarsForEachBrand(brandName: brandName);
    result.fold(
      (l) =>
          emit(GetCarsForEachBrandFailureState(errorMessage: l.errorMessage)),
      (r) => emit(GetCarsForEachBrandSuccessState(carsForEachBrand: r)),
    );
  }
}
