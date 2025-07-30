import 'dart:io';

import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/notifications/logic/cubits/send_notification_to_all_users/send_notification_to_all_users_cubit.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_cubit.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_state.dart';
import 'package:carvana/features/sell%20car/logic/cubits/upload_car_cubit.dart';
import 'package:carvana/features/sell%20car/ui/widgets/car_image_uploader.dart';
import 'package:carvana/features/sell%20car/ui/widgets/csutom_car_brand_widget.dart';
import 'package:carvana/features/sell%20car/ui/widgets/cusom_car_owner_information.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_available_for_rent_widget.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_button.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_fuel_type.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_information.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_more_details_widget.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_transmition_widhet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SellCarViewBody extends StatefulWidget {
  const SellCarViewBody({super.key});

  @override
  State<SellCarViewBody> createState() => _SellCarViewBodyState();
}

class _SellCarViewBodyState extends State<SellCarViewBody> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerEmailController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final TextEditingController ownerAddressController = TextEditingController();

  final TextEditingController carModelController = TextEditingController();
  final TextEditingController carCapacityController = TextEditingController();
  final TextEditingController carEngineController = TextEditingController();
  final TextEditingController carMaxSpeedController = TextEditingController();
  final TextEditingController carManufactureYearController =
      TextEditingController();
  final TextEditingController carNumberOfLitresBer100KmController =
      TextEditingController();
  final TextEditingController carNumberOfSlyndersController =
      TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController carDescriptionController =
      TextEditingController();

  final TextEditingController carColorController = TextEditingController();

  String? selectedCarTtpe;
  String? selectedCarBrand;
  String? selectedCarFuelType;
  String? selectedCarTransmission;
  String? selectedCarAutoPark;
  bool isAvailableForRent = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  List<String>? carImagesUrls;
  List<File>? _images;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCarCubit, UploadCarState>(
      listener: (context, state) {
        if (state is UploadCarSuccess) {
          showSnakBar(
            context,
            message: 'Car uploaded successfully',
            color: AppColors.whiteColor,
          );
          context
              .read<SendNotificationToAllUsersCubit>()
              .sendNotificationToAllUsers(
                sellerName: ownerNameController.text,
                carmodel: selectedCarBrand!,
              );
          context.pop(true);
        } else if (state is UploadCarFailure) {
          showSnakBar(
            context,
            message: state.message,
            color: AppColors.whiteColor,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sell your car'),
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CusomCarOwnerInformation(
                        ownerNameController: ownerNameController,
                        ownerEmailController: ownerEmailController,
                        ownerPhoneNumberController: ownerPhoneController,
                        ownerAddressController: ownerAddressController,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                    SliverToBoxAdapter(
                      child: CustomCarInformation(
                        onTypeSelected: (p0) {
                          setState(() {
                            selectedCarTtpe = p0;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CustomAvailableForRentWidget(
                        onChanged: (value) {
                          setState(() {
                            isAvailableForRent = value;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CsutomCarBrandWidget(
                        onBrandSelected: (value) {
                          setState(() {
                            selectedCarBrand = value;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CustomCarTransmitionWidhet(
                        onTransmitionTypeChanged: (value) {
                          setState(() {
                            selectedCarTransmission = value;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CustomCarFuelType(
                        onFuelTypeChanged: (value) {
                          setState(() {
                            selectedCarFuelType = value;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CustomCarMoreDetailsWidget(
                        carModelCotroller: carModelController,
                        carCapacityController: carCapacityController,
                        engineController: carEngineController,
                        carMaxSpeedController: carMaxSpeedController,
                        carNumberOfLitresBer100Km:
                            carNumberOfLitresBer100KmController,
                        carManufutureYear: carManufactureYearController,
                        carNumberOfSlyndersController:
                            carNumberOfSlyndersController,
                        carPriceController: carPriceController,
                        carDescriptionController: carDescriptionController,
                        carColorController: carColorController,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                    SliverToBoxAdapter(
                      child: CarImageUploader(
                        onImagesPicked: (images) {
                          setState(() {
                            _images = images;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 15.h)),

                    BlocListener<CarImagesCubit, CarImagesState>(
                      listener: (context, state) {
                        if (state is CarImagesSuccess) {
                          context.read<UploadCarCubit>().uploadCar(
                            carModel: CarModel(
                              sellerId:
                                  Supabase.instance.client.auth.currentUser!.id,
                              sellerName: ownerNameController.text.trim(),
                              sellerEmail: ownerEmailController.text.trim(),
                              sellerPhone: ownerPhoneController.text.trim(),
                              sellerAddress: ownerAddressController.text.trim(),
                              carStatus: selectedCarTtpe!,
                              carBrand: selectedCarBrand!,
                              carTransmission: selectedCarTransmission!,

                              carFuel: selectedCarFuelType!,
                              carId: '',
                              carModel: carModelController.text.trim(),
                              carCapacity: carCapacityController.text.trim(),
                              carEngine: carEngineController.text.trim(),
                              carMaxSpeed: carMaxSpeedController.text.trim(),
                              carNumberOfSylenders:
                                  carNumberOfSlyndersController.text.trim(),
                              carNumberOfLitresBer100Km:
                                  carNumberOfLitresBer100KmController.text
                                      .trim(),
                              carColor: carColorController.text.trim(),
                              carPrice: carPriceController.text.trim(),
                              carDescription: carDescriptionController.text
                                  .trim(),
                              availableForRent: isAvailableForRent,
                              carImage1: state.imageUrls[0],
                              carImage2: state.imageUrls[1],
                              carImage3: state.imageUrls[2],
                              carImage4: state.imageUrls[3],
                              carImage5: state.imageUrls[4],
                              carImage6: state.imageUrls[5],
                              carManufuctureYear: carManufactureYearController
                                  .text
                                  .trim(),
                            ),
                          );
                        } else if (state is CarImagesFailure) {
                          showSnakBar(
                            context,
                            message: state.error,
                            color: AppColors.whiteColor,
                          );
                        }
                      },
                      child: SliverToBoxAdapter(
                        child: CustomButton(
                          text: 'Sell Now',
                          onTap: () {
                            if (formKey.currentState!.validate() &&
                                _images != null &&
                                _images!.length == 6 &&
                                selectedCarTtpe != null &&
                                selectedCarBrand != null &&
                                selectedCarTransmission != null &&
                                selectedCarFuelType != null) {
                              formKey.currentState!.save();
                              context.read<CarImagesCubit>().uploadImages(
                                _images!,
                              );
                            } else if (_images == null) {
                              showSnakBar(
                                context,
                                message: 'Car images are required',
                                color: AppColors.whiteColor,
                              );
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            } else if (_images!.length < 6) {
                              showSnakBar(
                                context,
                                message: 'Please upload 6 car images.',
                                color: AppColors.whiteColor,
                              );
                            } else {
                              showSnakBar(
                                context,
                                message: 'All fields are required',
                                color: AppColors.whiteColor,
                              );
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
