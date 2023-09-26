import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/students.dart';

class StudentRepositoy {
  Future<List<Students>> findAll() async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }

    final studentsData = jsonDecode(studentsResult.body);

    return studentsData.map<Students>((student) {
      return Students.fromMap(student);
    }).toList();
  }

  Future<Students> findbyById(int id) async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }

    if (studentsResult.body == {}) {
      throw Exception();
    }

    return Students.fromJson(studentsResult.body);
  }

  Future<void> insert(Students students) async {
    final response = await http.post(
        Uri.parse('http://localhost:8080/students'),
        body: students.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(Students students) async {
    final response = await http.put(
        Uri.parse('http://localhost:8080/students/${students.id}'),
        body: students.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:8080/students/$id'));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
