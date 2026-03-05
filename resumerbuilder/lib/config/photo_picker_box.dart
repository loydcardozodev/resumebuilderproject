import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class PhotoPickerBox extends StatefulWidget {
  final Function(File)? onImageSelected;

  const PhotoPickerBox({super.key, this.onImageSelected});

  @override
  State<PhotoPickerBox> createState() => _PhotoPickerBoxState();
}

class _PhotoPickerBoxState extends State<PhotoPickerBox> {
  File? _image;

  Future<void> _pickAndCropImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          cropStyle: CropStyle.circle,
          lockAspectRatio: false,
        ),
      ],
    );

    if (cropped == null) return;

    final file = File(cropped.path);

    setState(() {
      _image = file;
    });

    if (widget.onImageSelected != null) {
      widget.onImageSelected!(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickAndCropImage,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.camera_alt_outlined, color: Colors.deepPurple),
                  SizedBox(height: 10),
                  Text(
                    'Add Photo',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
      ),
    );
  }
}
