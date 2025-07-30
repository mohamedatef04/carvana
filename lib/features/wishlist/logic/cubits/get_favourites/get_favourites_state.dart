part of 'get_favourites_cubit.dart';

@immutable
abstract class GetFavouritesState {}

class GetFavouritesInitial extends GetFavouritesState {}

class GetFavouritesLoadingState extends GetFavouritesState {}

class GetFavouritesEmptyState extends GetFavouritesState {}

class RemovedFavSuccessState extends GetFavouritesState {}

class GetFavouritesSuccessState extends GetFavouritesState {
  final List<CarModel> favList;

  GetFavouritesSuccessState({required this.favList});
}

class GetFavouritesErrorState extends GetFavouritesState {
  final String errorMessage;

  GetFavouritesErrorState(this.errorMessage);
}
