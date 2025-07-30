import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/home/logic/cubits/get_car_seller_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSellerImageWidget extends StatefulWidget {
  const CustomSellerImageWidget({super.key, required this.carModel});

  final CarModel carModel;

  @override
  State<CustomSellerImageWidget> createState() =>
      _CustomSellerImageWidgetState();
}

class _CustomSellerImageWidgetState extends State<CustomSellerImageWidget> {
  @override
  void initState() {
    context.read<GetCarSellerImageCubit>().getCarSellerImage(
      userId: widget.carModel.sellerId!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCarSellerImageCubit, GetCarSellerImageState>(
      builder: (context, state) {
        if (state is GetCarSellerImageSuccess) {
          return Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.veryDarkGreyColor,
              border: Border.all(color: AppColors.darkGreyColor),
              shape: BoxShape.circle,
              image: state.userDataModel.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(state.userDataModel.imageUrl!),
                      fit: BoxFit.fill,
                    )
                  : const DecorationImage(
                      image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/128/149/149071.png',
                      ),
                      fit: BoxFit.fill,
                    ),
            ),
          );
        } else if (state is GetCarSellerImageFailure) {
          throw Exception(state.errorMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
