import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ResumeSelectField extends StatefulWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  final String email;

  const ResumeSelectField({
    Key? key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.email,
  }) : super(key: key);

  @override
  _ResumeSelectFieldState createState() => _ResumeSelectFieldState();
}

class _ResumeSelectFieldState extends State<ResumeSelectField> {
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> _getResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File resumeFile = File(result.files.single.path!);
      String resumeUrl = await uploadResumeToFirebaseStorage(resumeFile);

      // Set the resume URL in the controller
      widget.controller.text = resumeUrl;

      // Update the UI
      setState(() {});
    }
  }

  Future<String> uploadResumeToFirebaseStorage(File resumeFile) async {
    try {
      String fileName = widget.email.split('@').first;
      String fileType = 'pdf'; // Resume file type is always PDF
      Reference storageReference =
          storageRef.child('pdfs/resumes/$fileName.$fileType');
      UploadTask uploadTask = storageReference.putFile(resumeFile);
      await uploadTask.whenComplete(() => null);
      String resumeUrl = await storageReference.getDownloadURL();
      return resumeUrl;
    } catch (error) {
      print('Error uploading resume: $error');
      return ''; // Handle the error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(widget.icon),
        title: Text(widget.title),
        subtitle:
            widget.controller.text.isNotEmpty ? Text('Resume Selected') : null,
        onTap: () {
          _getResume();
        },
      ),
    );
  }
}
