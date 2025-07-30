import 'package:equatable/equatable.dart';

abstract class UserImageState extends Equatable {
  const UserImageState();

  @override
  List<Object?> get props => [];
}

class UserImageInitial extends UserImageState {}

class UserImageUploading extends UserImageState {}

class UserImageUploadSuccess extends UserImageState {
  final String imageUrl;

  const UserImageUploadSuccess(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class UserImageUploadFailure extends UserImageState {
  final String error;

  const UserImageUploadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
