// lib/data/repositories/car_images_repository_impl.dart
import 'dart:io';
import 'package:carvana/core/network/supabase_constanst.dart';
import 'package:carvana/features/sell%20car/logic/repos/car_images_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';

class CarImagesRepoImpl implements CarImagesRepo {
  final SupabaseClient _client;

  CarImagesRepoImpl(this._client);

  @override
  Future<List<String>> uploadCarImages(List<File> images) async {
    final List<String> uploadedUrls = [];
    final storage = _client.storage;
    final userId = _client.auth.currentUser?.id ?? 'public';

    for (File image in images) {
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${basename(image.path)}';
      final fileBytes = await image.readAsBytes();

      await storage
          .from(carsImagesBucketName)
          .uploadBinary(
            '$userId/$fileName',
            fileBytes,
            fileOptions: const FileOptions(
              upsert: true,
              contentType: 'image/jpeg',
            ),
          );

      final url = storage
          .from(carsImagesBucketName)
          .getPublicUrl('$userId/$fileName');
      uploadedUrls.add(url);
    }

    return uploadedUrls;
  }
}
