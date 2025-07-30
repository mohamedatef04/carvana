class CarModel {
  final String? sellerId;
  final String sellerName;
  final String sellerEmail;
  final String sellerPhone;
  final String sellerAddress;
  final String? carId;
  final String carBrand;
  final String carModel;
  final String carStatus;
  final String carDescription;
  final String carCapacity;
  final String carTransmission;
  final String carFuel;
  final String carEngine;
  final String carMaxSpeed;
  final String carNumberOfSylenders;
  final String carNumberOfLitresBer100Km;
  final String carManufuctureYear;
  final bool availableForRent;
  final String carColor;
  final String carPrice;
  final String? carImage1;
  final String? carImage2;
  final String? carImage3;
  final String? carImage4;
  final String? carImage5;
  final String? carImage6;

  final List? favCars;

  CarModel({
    this.sellerId,
    required this.sellerName,
    required this.sellerEmail,
    required this.sellerPhone,
    required this.sellerAddress,
    this.carId,
    required this.carBrand,
    required this.carModel,
    required this.carStatus,
    required this.carDescription,
    required this.carCapacity,
    required this.carTransmission,
    required this.carFuel,
    required this.carEngine,
    required this.carMaxSpeed,
    required this.carNumberOfSylenders,
    required this.carNumberOfLitresBer100Km,
    required this.carManufuctureYear,
    required this.availableForRent,
    required this.carColor,
    required this.carPrice,
    this.carImage1,
    this.carImage2,
    this.carImage3,
    this.carImage4,
    this.carImage5,
    this.carImage6,
    this.favCars,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      sellerId: json['seller_id'],
      sellerName: json['seller_name'],
      sellerEmail: json['seller_email'],
      sellerPhone: json['seller_phone'],
      sellerAddress: json['seller_address'],
      carId: json['car_id'],
      carBrand: json['car_brand'],
      carModel: json['car_model'],
      carStatus: json['car_status'],
      carDescription: json['car_description'],
      carCapacity: json['car_capacity'],
      carTransmission: json['car_transmission_type'],
      carFuel: json['car_fuel'],
      carEngine: json['car_engine'],
      carMaxSpeed: json['car_max_speed'],
      carNumberOfSylenders: json['car_number_of_sylenders'],
      carNumberOfLitresBer100Km: json['car_number_of_litres'],
      carManufuctureYear: json['car_manufucture_year'],
      availableForRent: json['available_for_rent'],
      carColor: json['car_color'],
      carPrice: json['car_price'],
      carImage1: json['car_image_1'],
      carImage2: json['car_image_2'],
      carImage3: json['car_image_3'],
      carImage4: json['car_image_4'],
      carImage5: json['car_image_5'],
      carImage6: json['car_image_6'],
      favCars: json['favourites_cars'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'seller_id': sellerId,
      'seller_name': sellerName,
      'seller_email': sellerEmail,
      'seller_phone': sellerPhone,
      'seller_address': sellerAddress,
      'car_id': carId,
      'car_brand': carBrand,
      'car_model': carModel,
      'car_status': carStatus,
      'car_description': carDescription,
      'car_capacity': carCapacity,
      'car_transmission_type': carTransmission,
      'car_fuel': carFuel,
      'car_engine': carEngine,
      'car_max_speed': carMaxSpeed,
      'car_number_of_sylenders': carNumberOfSylenders,
      'car_number_of_litres': carNumberOfLitresBer100Km,
      'car_manufucture_year': carManufuctureYear,
      'available_for_rent': availableForRent,
      'car_color': carColor,
      'car_price': carPrice,
      'car_image_1': carImage1,
      'car_image_2': carImage2,
      'car_image_3': carImage3,
      'car_image_4': carImage4,
      'car_image_5': carImage5,
      'car_image_6': carImage6,
    };
  }

  factory CarModel.placeholder() {
    return CarModel(
      carId: '',
      carImage1: '',
      sellerName: '',
      sellerEmail: '',
      sellerPhone: '',
      sellerAddress: '',
      carModel: '',
      carEngine: '',
      carTransmission: '',
      carMaxSpeed: '',
      sellerId: '',
      carBrand: '',
      carStatus: '',
      carDescription: '',
      carCapacity: '',
      carFuel: '',
      carNumberOfSylenders: '',
      carNumberOfLitresBer100Km: '',
      availableForRent: false,
      carManufuctureYear: '',
      carColor: '',
      carPrice: '',
      carImage2: '',
      carImage3: '',
      carImage4: '',
      carImage5: '',
      carImage6: '',
    );
  }
}
