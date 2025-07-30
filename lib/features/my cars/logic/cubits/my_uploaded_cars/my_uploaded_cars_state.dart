part of 'my_uploaded_cars_cubit.dart';

abstract class MyUploadedCarsState extends Equatable {
  const MyUploadedCarsState();

  @override
  List<Object> get props => [];
}

class MyUploadedCarsInitial extends MyUploadedCarsState {}

class MyUploadedCarsLoading extends MyUploadedCarsState {}

class MyUploadedCarsLoaded extends MyUploadedCarsState {
  final List<CarModel> carsList;
  const MyUploadedCarsLoaded({required this.carsList});
}

class MyUploadedCarsError extends MyUploadedCarsState {
  final String errorMessage;
  const MyUploadedCarsError({required this.errorMessage});
}

class MyUploadedCarsEmpty extends MyUploadedCarsState {}

class MyUploadedCarsAfterDelete extends MyUploadedCarsState {
  final List<CarModel> carsList;
  const MyUploadedCarsAfterDelete({required this.carsList});
}

class DeleteMyUploadedCarSuccess extends MyUploadedCarsState {}

class LoadingMyUploadedCarAfterDelete extends MyUploadedCarsState {}

class DeleteMyUploadedCarFailure extends MyUploadedCarsState {
  final String errorMessage;
  const DeleteMyUploadedCarFailure({required this.errorMessage});
}
