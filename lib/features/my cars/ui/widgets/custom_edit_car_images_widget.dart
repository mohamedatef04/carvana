// import 'dart:io';
// import 'package:carvana_app/core/models/car_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CustomEditCarImagesWidget extends StatefulWidget {
//   const CustomEditCarImagesWidget({
//     super.key,

//     required this.carModel,
//     required this.onImagePicked,
//   });

//   final CarModel carModel;
//   final ValueChanged<List<String>> onImagePicked;

//   @override
//   CarImageUploaderState createState() => CarImageUploaderState();
// }

// class CarImageUploaderState extends State<CustomEditCarImagesWidget> {
//   final List<String> imagePaths = [];

//   @override
//   void initState() {
//     imagePaths.addAll([
//       widget.carModel.carImage1,
//       widget.carModel.carImage2,
//       widget.carModel.carImage3,
//       widget.carModel.carImage4,
//       widget.carModel.carImage5,
//       widget.carModel.carImage6,
//     ]);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       widget.onImagePicked(List.from(imagePaths));
//     });

//     super.initState();
//   }

//   Future<void> _pickImage() async {
//     if (imagePaths.length >= 6) return;

//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imagePaths.add(pickedFile.path); // this is a local file path
//         widget.onImagePicked(List.from(imagePaths)); // no File() used!
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> imageWidgets = [];

//     for (int i = 0; i < imagePaths.length; i++) {
//       imageWidgets.add(
//         Stack(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               margin: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: imagePaths[i].startsWith('http')
//                       ? NetworkImage(imagePaths[i])
//                       : FileImage(File(imagePaths[i])) as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     imagePaths.removeAt(i);
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black54,
//                   ),
//                   child: const Icon(Icons.close, color: Colors.white, size: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (imagePaths.length < 6) {
//       imageWidgets.add(
//         GestureDetector(
//           onTap: _pickImage,
//           child: Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Icon(Icons.add_a_photo, color: Colors.grey[600]),
//           ),
//         ),
//       );
//     }

//     return Wrap(children: imageWidgets);
//   }
// }
