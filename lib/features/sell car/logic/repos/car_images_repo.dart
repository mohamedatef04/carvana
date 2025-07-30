import 'dart:io';

abstract class CarImagesRepo {
  Future<List<String>> uploadCarImages(List<File> images);
}
