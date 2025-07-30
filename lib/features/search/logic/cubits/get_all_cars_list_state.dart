part of 'get_all_cars_list_cubit.dart';

@immutable
abstract class GetSearchedCarsListState {}

class GetSearchedCarsListInitial extends GetSearchedCarsListState {}

class GetSearchedCarsListLoadingState extends GetSearchedCarsListState {}

class GetSearchedCarsListEmptyState extends GetSearchedCarsListState {}

class GetSearchedCarsListLoadedState extends GetSearchedCarsListState {
  final List<CarModel> carsList;
  GetSearchedCarsListLoadedState({required this.carsList});
}

class GetSearchedCarsListFailureState extends GetSearchedCarsListState {
  final String errorMessage;
  GetSearchedCarsListFailureState({required this.errorMessage});
}
