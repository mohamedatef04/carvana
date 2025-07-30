import 'dart:io';

abstract class UserImageRepo {
  Future<String> uploadUserImage(File imageFile);
}
