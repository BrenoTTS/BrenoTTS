import 'dart:convert';

class Courses {
  int id;
  String name;
  bool isStudent;
  Courses({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] as int,
      name: map['name'] as String,
      isStudent: map['isStudent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Courses.fromJson(String source) =>
      Courses.fromMap(json.decode(source) as Map<String, dynamic>);
}
