import 'dart:async';

import 'package:flutter/material.dart';
import 'package:placed/constants/constants.dart';
import 'package:placed/mvvm/Components/customProfileField.dart';
import 'package:placed/mvvm/Components/imageInput.dart';
import 'package:placed/mvvm/Components/textAreaInput.dart';
import 'package:placed/mvvm/Components/textInput.dart';
import 'package:placed/mvvm/Models/student.model.dart';
import 'package:placed/utils/fetchData/postData.dart';

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
    profileData = AppConstant.student;
    didChangeDependencies();

    getData();
  }

   getData() async {
    print("startign post ");
    await postData("http://localhost:3000/api/students/getstudent",
        {"email": "jigovind556"});
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

  void didChangeDependencies() {
    super.didChangeDependencies();
    // Set the controller values based on the profileData
    _nameController.text = profileData?.name ?? '';
    _branchController.text = profileData?.branch ?? '';
    _passingYearController.text = profileData?.passingYear.toString() ?? '';
    _rollNumberController.text = profileData?.rollNumber ?? '';
    _sectionController.text = profileData?.section ?? '';
    _subsectionController.text = profileData?.subsection ?? '';
    _emailController.text = profileData?.email ?? '';
    _mobileNumberController.text = profileData?.mobileNumber ?? '';
    _addressController.text = profileData?.address ?? '';
  }

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
              ProfileField(
                icon: Icons.person,
                title: 'Name',
                controller: _nameController,
                hintText: 'Name',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.business,
                title: 'Branch',
                controller: _branchController,
                hintText: 'Branch',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.calendar_today,
                title: 'Passing Year',
                controller: _passingYearController,
                hintText: 'Passing Year',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.confirmation_number,
                title: 'Roll Number',
                controller: _rollNumberController,
                hintText: 'Roll Number',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.view_list,
                title: 'Section',
                controller: _sectionController,
                hintText: 'Section',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.view_module,
                title: 'Subsection',
                controller: _subsectionController,
                hintText: 'Subsection',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.email,
                title: 'Email',
                controller: _emailController,
                hintText: 'Email',
              ),
              SizedBox(height: 20),
              ProfileField(
                icon: Icons.phone,
                title: 'Mobile Number',
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
