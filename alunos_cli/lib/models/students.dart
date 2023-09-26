import 'dart:convert';

import 'address.dart';
import 'courses.dart';

class Students {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Address address;

  Students({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => json.encode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        age: map['age'],
        nameCourses: List<String>.from((map['nameCourses'] ?? <String>[])),
        courses: map['courses']
                ?.map<Courses>((coursesMap) => Courses.fromMap(coursesMap))
                .toList() ??
            <Courses>[],
        address: Address.fromMap(map['address'] ?? <String, dynamic>{}));
  }

  factory Students.fromJson(String source) =>
      Students.fromMap(json.decode(source) as Map<String, dynamic>);
}
