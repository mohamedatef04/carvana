// lib/logic/cubit/car_images_cubit.dart
import 'dart:io';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_state.dart';
import 'package:carvana/features/sell%20car/logic/repos/car_images_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarImagesCubit extends Cubit<CarImagesState> {
  final CarImagesRepo repository;

  CarImagesCubit(this.repository) : super(CarImagesInitial());

  Future<void> uploadImages(List<File> images) async {
    emit(CarImagesUploading());
    try {
      final urls = await repository.uploadCarImages(images);
      emit(CarImagesSuccess(urls));
    } catch (e) {
      emit(CarImagesFailure(e.toString()));
    }
  }
}
