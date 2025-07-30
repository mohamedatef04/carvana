// lib/logic/cubit/car_images_state.dart
import 'package:equatable/equatable.dart';

abstract class CarImagesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarImagesInitial extends CarImagesState {}

class CarImagesUploading extends CarImagesState {}

class CarImagesSuccess extends CarImagesState {
  final List<String> imageUrls;

  CarImagesSuccess(this.imageUrls);

  @override
  List<Object?> get props => [imageUrls];
}

class CarImagesFailure extends CarImagesState {
  final String error;

  CarImagesFailure(this.error);

  @override
  List<Object?> get props => [error];
}
