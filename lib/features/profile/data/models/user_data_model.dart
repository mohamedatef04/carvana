import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;
  final String? imageUrl;

  final String? fcmToken;

  const UserDataModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    this.imageUrl,
    this.fcmToken,
  });
  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    phoneNumber,
    address,
    imageUrl,
    fcmToken,
  ];

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      email: json['user_email'],
      firstName: json['user_first_name'],
      lastName: json['user_last_name'],
      phoneNumber: json['user_phone'],
      address: json['user_address'],
      imageUrl: json['user_image_url'],
      fcmToken: json['fcm_token'],
    );
  }
}
