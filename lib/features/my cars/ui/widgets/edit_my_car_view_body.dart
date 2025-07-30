import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/my%20cars/logic/cubits/edit_my_uploaded_car/edit_my_uploaded_car_cubit.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_available_for_rent_widget.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_bottom.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_car_brand_widget.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_car_fuel_type.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_car_information_widget.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_car_transimition_typr.dart';
import 'package:carvana/features/sell%20car/ui/widgets/cusom_car_owner_information.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_more_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditMyCarViewBody extends StatefulWidget {
  const EditMyCarViewBody({super.key, required this.carModel});

  final CarModel carModel;

  @override
  State<EditMyCarViewBody> createState() => _SellCarViewBodyState();
}

class _SellCarViewBodyState extends State<EditMyCarViewBody> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerEmailController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final TextEditingController ownerAddressController = TextEditingController();

  final TextEditingController carModelController = TextEditingController();
  final TextEditingController carCapacityController = TextEditingController();
  final TextEditingController carEngineController = TextEditingController();
  final TextEditingController carMaxSpeedController = TextEditingController();
  final TextEditingController carNumberOfLitersController =
      TextEditingController();
  final TextEditingController carManufacturerYearController =
      TextEditingController();
  final TextEditingController carNumberOfSlyndersController =
      TextEditingController();

  final TextEditingController carDescriptionController =
      TextEditingController();

  final TextEditingController carPriceController = TextEditingController();

  final TextEditingController carColorController = TextEditingController();

  // ...controllers unchanged...

  String? selectedCarType;
  String? selectedCarBrand;
  String? selectedCarFuelType;
  String? selectedCarTransmission;
  String? selectedCarAutoPark;

  bool isAvailableForRent = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  List<String>? carImagesUrls;

  @override
  void initState() {
    ownerNameController.text = widget.carModel.sellerName;
    ownerEmailController.text = widget.carModel.sellerEmail;
    ownerPhoneController.text = widget.carModel.sellerPhone;
    ownerAddressController.text = widget.carModel.sellerAddress;
    carModelController.text = widget.carModel.carModel;
    carCapacityController.text = widget.carModel.carCapacity.toString();
    carEngineController.text = widget.carModel.carEngine.toString();
    carMaxSpeedController.text = widget.carModel.carMaxSpeed.toString();
    carNumberOfLitersController.text = widget.carModel.carNumberOfLitresBer100Km
        .toString();
    carManufacturerYearController.text = widget.carModel.carManufuctureYear
        .toString();
    carNumberOfSlyndersController.text = widget.carModel.carNumberOfSylenders
        .toString();
    carPriceController.text = widget.carModel.carPrice.toString();
    carDescriptionController.text = widget.carModel.carDescription;
    carColorController.text = widget.carModel.carColor;
    selectedCarType = widget.carModel.carStatus;
    selectedCarBrand = widget.carModel.carBrand;
    selectedCarTransmission = widget.carModel.carTransmission;
    selectedCarFuelType = widget.carModel.carFuel;

    super.initState();
  }

  @override
  void dispose() {
    ownerNameController.dispose();
    ownerEmailController.dispose();
    ownerPhoneController.dispose();
    ownerAddressController.dispose();
    carModelController.dispose();
    carCapacityController.dispose();
    carEngineController.dispose();
    carMaxSpeedController.dispose();
    carNumberOfLitersController.dispose();
    carManufacturerYearController.dispose();
    carNumberOfSlyndersController.dispose();
    carPriceController.dispose();
    carDescriptionController.dispose();
    carColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Your Car'),
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
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
                  child: CustomEditCarInformationWidget(
                    carModel: widget.carModel,
                    onTypeSelected: (p0) {
                      setState(() {
                        selectedCarType = p0;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: CustomEditAvailableForRentWidget(
                    carModel: widget.carModel,
                    onChanged: (p0) {
                      setState(() {
                        isAvailableForRent = p0;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: CustomEditCarBrandWidget(
                    carModel: widget.carModel,
                    onBrandSelected: (value) {
                      setState(() {
                        selectedCarBrand = value;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: CustomEditCarTransimitionTypr(
                    carModel: widget.carModel,
                    onTransmitionTypeChanged: (value) {
                      setState(() {
                        selectedCarTransmission = value;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: CustomEditCarFuelType(
                    carModel: widget.carModel,
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
                    carNumberOfLitresBer100Km: carNumberOfLitersController,
                    carNumberOfSlyndersController:
                        carNumberOfSlyndersController,
                    carPriceController: carPriceController,
                    carDescriptionController: carDescriptionController,
                    carColorController: carColorController,
                    carManufutureYear: carManufacturerYearController,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),

                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: CustomEditBottom(
                    text: 'Edit Your Car',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<EditMyUploadedCarCubit>()
                            .editMyUploadedCars(
                              carId: widget.carModel.carId!,
                              carModel: CarModel(
                                sellerName: ownerNameController.text.trim(),
                                sellerEmail: ownerEmailController.text.trim(),
                                sellerPhone: ownerPhoneController.text.trim(),
                                sellerAddress: ownerAddressController.text
                                    .trim(),
                                carBrand: selectedCarBrand!,
                                carModel: carModelController.text.trim(),
                                carStatus: selectedCarType!,
                                carDescription: carDescriptionController.text
                                    .trim(),
                                carCapacity: carCapacityController.text.trim(),
                                carTransmission: selectedCarTransmission!,
                                carFuel: selectedCarFuelType!,
                                carEngine: carEngineController.text.trim(),
                                carMaxSpeed: carMaxSpeedController.text.trim(),
                                carNumberOfSylenders:
                                    carNumberOfSlyndersController.text.trim(),
                                carNumberOfLitresBer100Km:
                                    carNumberOfLitersController.text.trim(),
                                carManufuctureYear:
                                    carManufacturerYearController.text.trim(),
                                availableForRent: isAvailableForRent,
                                carColor: carColorController.text.trim(),
                                carPrice: carPriceController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
