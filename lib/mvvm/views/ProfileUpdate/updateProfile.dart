import 'package:flutter/material.dart';
import 'package:placed/constants/constants.dart';
import 'package:placed/mvvm/Components/imageInput.dart';
import 'package:placed/mvvm/Components/textAreaInput.dart';
import 'package:placed/mvvm/Components/textInput.dart';
import 'package:placed/mvvm/Models/student.model.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  // Editable form fields
  Student? profileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileData = student;
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _branchController = TextEditingController();
  TextEditingController _passingYearController = TextEditingController();
  TextEditingController _rollNumberController = TextEditingController();
  TextEditingController _sectionController = TextEditingController();
  TextEditingController _subsectionController = TextEditingController();
  TextEditingController _resumeController = TextEditingController();
  TextEditingController _currentCgpaController = TextEditingController();
  TextEditingController _skillsController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // Non-editable fields
  String _userId = "12345"; // Replace with user-specific data
  String _onCampusStatus = "Unplaced"; // Replace with user-specific data
  String _offCampusStatus = "Unplaced"; // Replace with user-specific data

  // Function to handle updating profile
  void _updateProfile() {
    // Implement your logic to update the profile using the entered data
    String updatedName = _nameController.text;
    String updatedBranch = _branchController.text;
    String updatedPassingYear = _passingYearController.text;
    String updatedRollNumber = _rollNumberController.text;
    String updatedSection = _sectionController.text;
    String updatedSubsection = _subsectionController.text;
    String updatedResume = _resumeController.text;
    String updatedCurrentCgpa = _currentCgpaController.text;
    String updatedSkills = _skillsController.text;
    String updatedEmail = _emailController.text;
    String updatedMobileNumber = _mobileNumberController.text;
    String updatedAddress = _addressController.text;

    // Print or use the updated data as per your requirements
    print('Updated Name: $updatedName');
    print('Updated Branch: $updatedBranch');
    print('Updated Passing Year: $updatedPassingYear');
    print('Updated Roll Number: $updatedRollNumber');
    print('Updated Section: $updatedSection');
    print('Updated Subsection: $updatedSubsection');
    print('Updated Resume: $updatedResume');
    print('Updated Current CGPA: $updatedCurrentCgpa');
    print('Updated Skills: $updatedSkills');
    print('Updated Email: $updatedEmail');
    print('Updated Mobile Number: $updatedMobileNumber');
    print('Updated Address: $updatedAddress');

    // You can add further logic to save the data to your backend or update state.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircularTextField(
                controller: _nameController,
                hintText: 'Name',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _branchController,
                hintText: 'Branch',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _passingYearController,
                hintText: 'Passing Year',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _rollNumberController,
                hintText: 'Roll Number',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _sectionController,
                hintText: 'Section',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _subsectionController,
                hintText: 'Sub section',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _emailController,
                hintText: 'Email',
              ),
              SizedBox(height: 20),
              CustomCircularTextField(
                controller: _mobileNumberController,
                hintText: 'Mobile Number',
              ),
              SizedBox(height: 20),
              CustomTextArea(
                controller: _addressController,
                hintText: 'Address',
              ),
              SizedBox(height: 20),
              CustomImageInput(),
              // Add similar code for other editable fields

              // Non-editable fields
              SizedBox(height: 20),
              Text('User ID: $_userId'),
              SizedBox(height: 20),
              Text('On Campus Status: $_onCampusStatus'),
              SizedBox(height: 20),
              Text('Off Campus Status: $_offCampusStatus'),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProfile,
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomCircularTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;

//   const CustomCircularTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           hintText: hintText,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: UpdateProfilePage(),
//   ));
// }
