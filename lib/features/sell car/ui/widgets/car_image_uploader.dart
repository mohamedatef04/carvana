import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CarImageUploader extends StatefulWidget {
  const CarImageUploader({super.key, required this.onImagesPicked});

  final ValueChanged<List<File>> onImagesPicked;

  @override
  CarImageUploaderState createState() => CarImageUploaderState();
}

class CarImageUploaderState extends State<CarImageUploader> {
  final List<File> _images = [];
  bool _isLoading = false;

  Future<void> _pickImage() async {
    if (_images.length >= 6) return;

    try {
      setState(() {
        _isLoading = true;
      });

      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null && mounted) {
        final File imageFile = File(pickedFile.path);

        // Verify file exists and is readable
        if (await imageFile.exists()) {
          setState(() {
            _images.add(imageFile);
            _isLoading = false;
          });
          widget.onImagesPicked(_images);
        } else {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            _showErrorDialog('Selected image file is not accessible');
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } on PlatformException catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(
          'Permission denied: ${e.message ?? 'Cannot access gallery'}',
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog('Failed to select image: ${e.toString()}');
      }
    }
  }

  void _showErrorDialog(String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _removeImage(int index) {
    if (mounted && index >= 0 && index < _images.length) {
      setState(() {
        _images.removeAt(index);
      });
      widget.onImagesPicked(_images);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = [];

    // Add existing images
    for (int i = 0; i < _images.length; i++) {
      imageWidgets.add(
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _images[i],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => _removeImage(i),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Add upload button if less than 6 images
    if (_images.length < 6) {
      imageWidgets.add(
        GestureDetector(
          onTap: _isLoading ? null : _pickImage,
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: _isLoading
                ? const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : Icon(
                    Icons.add_a_photo,
                    color: Colors.grey[600],
                    size: 32,
                  ),
          ),
        ),
      );
    }

    return Wrap(
      children: imageWidgets,
    );
  }
}
