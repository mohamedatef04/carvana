part of 'get_car_seller_image_cubit.dart';

abstract class GetCarSellerImageState extends Equatable {
  const GetCarSellerImageState();

  @override
  List<Object> get props => [];
}

class GetCarSellerImageInitial extends GetCarSellerImageState {}

class GetCarSellerImageSuccess extends GetCarSellerImageState {
  final UserDataModel userDataModel;
  const GetCarSellerImageSuccess({required this.userDataModel});
}

class GetCarSellerImageFailure extends GetCarSellerImageState {
  final String errorMessage;
  const GetCarSellerImageFailure({required this.errorMessage});
}
