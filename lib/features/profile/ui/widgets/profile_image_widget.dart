import 'dart:io';
import 'package:carvana/features/profile/logic/cubits/pass_user_image_url/pass_user_image_url_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/user_image/user_image_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/user_image/user_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  Future<void> _pickAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final file = File(pickedImage.path);
      context.read<UserImageCubit>().uploadImage(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<UserImageCubit, UserImageState>(
          builder: (context, state) {
            Widget imageWidget;

            if (state is UserImageUploading) {
              imageWidget = Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is UserImageUploadSuccess) {
              context.read<PassUserImageUrlCubit>().passUserImageUrl(
                imageUrl: state.imageUrl,
              );
              imageWidget = Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(state.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              imageWidget = Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }

            return imageWidget;
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _pickAndUploadImage(context),
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.edit, size: 15, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
