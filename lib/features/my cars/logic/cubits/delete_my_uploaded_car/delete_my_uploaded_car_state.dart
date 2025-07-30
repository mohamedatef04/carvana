part of 'delete_my_uploaded_car_cubit.dart';

abstract class DeleteMyUploadedCarState extends Equatable {
  const DeleteMyUploadedCarState();

  @override
  List<Object> get props => [];
}

class DeleteMyUploadedCarInitial extends DeleteMyUploadedCarState {}

class DeleteMyUploadedCarSuccess extends DeleteMyUploadedCarState {}

class DeleteMyUploadedCarFailure extends DeleteMyUploadedCarState {
  final String errorMessage;
  const DeleteMyUploadedCarFailure({required this.errorMessage});
}

class DeleteMyUploadedCarEmpty extends DeleteMyUploadedCarState {}

class MyUploadedCarsAfterDelete extends DeleteMyUploadedCarState {
  final List<CarModel> carsList;
  const MyUploadedCarsAfterDelete({required this.carsList});
}
