import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomEditCarImageUploader extends StatefulWidget {
  const CustomEditCarImageUploader({super.key, required this.onImagesPicked});

  final ValueChanged<List<File>> onImagesPicked;

  @override
  CarImageUploaderState createState() => CarImageUploaderState();
}

class CarImageUploaderState extends State<CustomEditCarImageUploader> {
  final List<File> _images = [];

  Future<void> _pickImage() async {
    if (_images.length >= 6) return;

    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        widget.onImagesPicked(_images);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = [];

    for (int i = 0; i < _images.length; i++) {
      imageWidgets.add(
        Expanded(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_images[i]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _images.removeAt(i);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_images.length < 6) {
      imageWidgets.add(
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Icon(Icons.add_a_photo, color: Colors.grey[600]),
          ),
        ),
      );
    }

    return Wrap(children: imageWidgets);
  }
}
