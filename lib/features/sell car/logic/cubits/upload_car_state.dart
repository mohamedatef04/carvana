part of 'upload_car_cubit.dart';

abstract class UploadCarState extends Equatable {
  const UploadCarState();

  @override
  List<Object> get props => [];
}

class UploadCarInitial extends UploadCarState {}

class UploadCarLoading extends UploadCarState {}

class UploadCarSuccess extends UploadCarState {}

class UploadCarFailure extends UploadCarState {
  final String message;
  const UploadCarFailure(this.message);
}
