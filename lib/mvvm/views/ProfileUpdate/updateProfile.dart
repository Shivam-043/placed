import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  // Editable form fields
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
              Text('Name:'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),
              Text('Branch:'),
              TextField(
                controller: _branchController,
                decoration: InputDecoration(
                  hintText: 'Enter your branch',
                ),
              ),
              SizedBox(height: 20),
              Text('Passing Year:'),
              TextField(
                controller: _passingYearController,
                decoration: InputDecoration(
                  hintText: 'Enter your passing year',
                ),
              ),
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

void main() {
  runApp(MaterialApp(
    home: UpdateProfilePage(),
  ));
}
