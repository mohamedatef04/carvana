part of 'add_to_fav_cubit.dart';

@immutable
abstract class AddToFavState {}

class AddToFavInitial extends AddToFavState {}

class AddToFavSuccess extends AddToFavState {}

class AddToFavFailure extends AddToFavState {
  final String errorMessage;
  AddToFavFailure({required this.errorMessage});
}
