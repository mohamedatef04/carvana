part of 'pass_user_image_url_cubit.dart';

abstract class PassUserImageUrlState extends Equatable {
  const PassUserImageUrlState();

  @override
  List<Object> get props => [];
}

class PassUserImageUrlInitial extends PassUserImageUrlState {}

class PassUserImageUrlSuccess extends PassUserImageUrlState {}

class PassUserImageUrlFailure extends PassUserImageUrlState {
  final String errorMessage;
  const PassUserImageUrlFailure({required this.errorMessage});
}
