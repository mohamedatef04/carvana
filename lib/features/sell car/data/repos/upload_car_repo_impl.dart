import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/features/sell%20car/logic/repos/upload_car_repo.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadCarRepoImpl implements UploadCarRepo {
  final ApiService apiService;

  UploadCarRepoImpl(this.apiService);
  @override
  Future<void> uploadCar({required CarModel carModel}) async {
    try {
      await apiService.postRequest(
        endpoint: carsTable,
        data: {
          'seller_id': Supabase.instance.client.auth.currentUser!.id,
          'seller_name': carModel.sellerName,
          'seller_email': carModel.sellerEmail,
          'seller_address': carModel.sellerAddress,
          'seller_phone': carModel.sellerPhone,
          'car_brand': carModel.carBrand,
          'car_status': carModel.carStatus,
          'car_description': carModel.carDescription,
          'car_capacity': carModel.carCapacity,
          'car_model': carModel.carModel,
          'car_transmission_type': carModel.carTransmission,
          'car_engine': carModel.carEngine,
          'car_max_speed': carModel.carMaxSpeed,
          'car_fuel': carModel.carFuel,
          'car_number_of_litres': carModel.carNumberOfLitresBer100Km,
          'car_number_of_sylenders': carModel.carNumberOfSylenders,
          'car_manufucture_year': carModel.carManufuctureYear,
          'available_for_rent': carModel.availableForRent,
          'car_color': carModel.carColor,
          'car_price': carModel.carPrice,
          'car_image_1': carModel.carImage1,
          'car_image_2': carModel.carImage2,
          'car_image_3': carModel.carImage3,
          'car_image_4': carModel.carImage4,
          'car_image_5': carModel.carImage5,
          'car_image_6': carModel.carImage6,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
