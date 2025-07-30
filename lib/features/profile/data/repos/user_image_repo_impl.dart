import 'dart:io';
import 'package:carvana/core/network/supabase_constanst.dart';
import 'package:carvana/features/profile/logic/repos/user_image_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserImageRepoImpl implements UserImageRepo {
  final SupabaseClient supabase;

  UserImageRepoImpl(this.supabase);

  @override
  Future<String> uploadUserImage(File imageFile) async {
    try {
      final String fileName =
          'user_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String path = 'users_images/$fileName';

      await supabase.storage
          .from(usersImagesBucketName)
          .upload(path, imageFile);

      final imageUrl = supabase.storage
          .from(usersImagesBucketName)
          .getPublicUrl(path);

      return imageUrl;
    } on Exception catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
