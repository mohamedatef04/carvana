import 'package:carvana/core/models/car_model.dart';

abstract class UploadCarRepo {
  Future<void> uploadCar({required CarModel carModel});
}
