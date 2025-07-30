part of 'get_explore_cars_cubit.dart';

@immutable
abstract class GetExploreCarsState {}

class GetExploreCarsInitial extends GetExploreCarsState {}

class GetExploreCarsLoadingState extends GetExploreCarsState {}

class GetExploreCarsLoadedState extends GetExploreCarsState {
  final List<CarModel> carsList;
  GetExploreCarsLoadedState({required this.carsList});
}

class GetExploreCarsErrorState extends GetExploreCarsState {
  final String errorMessage;
  GetExploreCarsErrorState({required this.errorMessage});
}
