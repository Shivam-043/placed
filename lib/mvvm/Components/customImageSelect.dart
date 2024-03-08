import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectField extends StatefulWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  final String email;

  const ImageSelectField({
    Key? key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.email,
  }) : super(key: key);

  @override
  _ImageSelectFieldState createState() => _ImageSelectFieldState();
}

class _ImageSelectFieldState extends State<ImageSelectField> {
  final ImagePicker _imagePicker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> _getImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    _setImage(image);
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    _setImage(image);
  }

  void _setImage(XFile? image) async {
    if (image != null) {
      // Upload the image to Firebase Storage and get the download URL
      // Replace the following line with your actual Firebase Storage upload logic
      String imageUrl = await uploadImageToFirebaseStorage(File(image.path));

      // Set the image URL in the controller
      widget.controller.text = imageUrl;

      // Update the UI
      setState(() {});
    }
  }

  Future<String> uploadImageToFirebaseStorage(File file) async {
    try {
      String fileName = widget.email.split('@').first;
      String fileType = file.path.split('.').last; // Get the image file type
      Reference storageReference =
          storageRef.child('images/profilePics/$fileName.$fileType');
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() => null);
      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print('Error uploading image: $error');
      return ''; // Handle the error appropriately
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(widget.icon),
        title: Text(widget.title),
        subtitle: widget.controller.text.isNotEmpty
            ? Image.network(
                widget.controller.text,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
            : null,
        onTap: () {
          // Display options to choose an image source
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Take Photo'),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromCamera();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Choose from Gallery'),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromGallery();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
