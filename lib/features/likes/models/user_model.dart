import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String fullName;
  final String age;
  final String occupation;
  final String description;
  final String imageProfile;
  User({
    required this.fullName,
    required this.age,
    required this.occupation,
    required this.description,
    required this.imageProfile,
  });

  @override
  String toString() {
    return 'User(fullName: $fullName, age: $age, occupation: $occupation, description: $description, imageProfile: $imageProfile)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'age': age,
      'occupation': occupation,
      'description': description,
      'imageProfile': imageProfile,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['fullName'] as String,
      age: map['age'] as String,
      occupation: map['occupation'] as String,
      description: map['description'] as String,
      imageProfile: map['imageProfile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
