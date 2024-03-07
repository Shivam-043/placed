class Branch {
  late String id;
  late String name;
  late String shortName;
  late List<String> sections;
  late List<String> subSections;

  Branch({
    required this.id,
    required this.name,
    required this.shortName,
    required this.sections,
    required this.subSections,
  });

  // Factory method to create a Branch instance from a map
  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['_id'],
      name: json['name'],
      shortName: json['shortName'],
      sections: List<String>.from(json['sections']),
      subSections: List<String>.from(json['subSections']),
    );
  }

  // Method to convert a Branch instance to a map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'shortName': shortName,
      'sections': sections,
      'subSections': subSections,
    };
  }
}
