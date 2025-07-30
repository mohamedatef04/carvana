import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_cubit.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(child: Text(text, style: AppStyles.black20)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<CarImagesCubit, CarImagesState>(
          builder: (context, state) {
            if (state is CarImagesUploading) {
              return const CircularProgressIndicator();
            } else if (state is CarImagesSuccess) {
              return Text('Uploaded ${state.imageUrls.length} images!');
            } else if (state is CarImagesFailure) {
              return Text(
                'Failed: ${state.error}',
                style: const TextStyle(color: Colors.red),
              );
            }
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
