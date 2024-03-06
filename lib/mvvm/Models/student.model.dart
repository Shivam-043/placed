class Student {
  String name;
  String branch;
  int passingYear;
  String rollNumber;
  String section;
  String subsection;
  String resume;
  double currentCgpa;
  String skills;
  String email;
  String mobileNumber;
  String address;
  String photo;
  String userId;
  String onCampusStatus;
  String offCampusStatus;

  Student({
    this.name = '',
    this.branch = '',
    this.passingYear = 0,
    this.rollNumber = '',
    this.section = '',
    this.subsection = '',
    this.resume = '',
    this.currentCgpa = 0.0,
    this.skills = '',
    this.email = '',
    this.mobileNumber = '',
    this.address = '',
    this.photo = '',
    this.userId = '',
    this.onCampusStatus = '',
    this.offCampusStatus = '',
  });

  // Named constructor to create Student object from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] ?? '',
      branch: json['branch'] ?? '',
      passingYear: json['passingYear'] ?? 0,
      rollNumber: json['rollNumber'] ?? '',
      section: json['section'] ?? '',
      subsection: json['subsection'] ?? '',
      resume: json['resume'] ?? '',
      currentCgpa: json['currentCgpa'] ?? 0.0,
      skills: json['skills'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      address: json['address'] ?? '',
      photo: json['photo'] ?? '',
      userId: json['userId'] ?? '',
      onCampusStatus: json['onCampusStatus'] ?? '',
      offCampusStatus: json['offCampusStatus'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'branch': branch,
      'passingYear': passingYear,
      'rollNumber': rollNumber,
      'section': section,
      'subsection': subsection,
      'resume': resume,
      'currentCgpa': currentCgpa,
      'skills': skills,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address,
      'photo': photo,
      'userId': userId,
      'onCampusStatus': onCampusStatus,
      'offCampusStatus': offCampusStatus,
    };
  }
}
