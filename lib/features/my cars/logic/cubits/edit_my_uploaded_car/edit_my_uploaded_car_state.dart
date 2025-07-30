part of 'edit_my_uploaded_car_cubit.dart';

abstract class EditMyUploadedCarState extends Equatable {
  const EditMyUploadedCarState();

  @override
  List<Object> get props => [];
}

class EditMyUploadedCarInitial extends EditMyUploadedCarState {}

class EditMyUploadedCarSuccess extends EditMyUploadedCarState {}

class EditMyUploadedCarFailure extends EditMyUploadedCarState {
  final String errorMessage;
  const EditMyUploadedCarFailure({required this.errorMessage});
}
