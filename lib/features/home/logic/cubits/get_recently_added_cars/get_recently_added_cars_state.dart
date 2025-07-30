part of 'get_recently_added_cars_cubit.dart';

@immutable
abstract class GetRecentlyAddedCarsState {}

class GetRecentlyAddedCarsInitial extends GetRecentlyAddedCarsState {}

class GetRecentlyAddedCarsLoading extends GetRecentlyAddedCarsState {}

class GetRecentlyAddedCarsSuccess extends GetRecentlyAddedCarsState {
  final List<CarModel> carsList;
  GetRecentlyAddedCarsSuccess({required this.carsList});
}

class GetRecentlyAddedCarsFailure extends GetRecentlyAddedCarsState {
  final String errorMessage;
  GetRecentlyAddedCarsFailure({required this.errorMessage});
}
