part of 'get_cars_for_each_brand_cubit.dart';

@immutable
abstract class GetCarsForEachBrandState {}

class GetCarsForEachBrandInitial extends GetCarsForEachBrandState {}

class GetCarsForEachBrandLoadingState extends GetCarsForEachBrandState {}

class GetCarsForEachBrandSuccessState extends GetCarsForEachBrandState {
  final List<CarModel> carsForEachBrand;
  GetCarsForEachBrandSuccessState({required this.carsForEachBrand});
}

class GetCarsForEachBrandFailureState extends GetCarsForEachBrandState {
  final String errorMessage;
  GetCarsForEachBrandFailureState({required this.errorMessage});
}
