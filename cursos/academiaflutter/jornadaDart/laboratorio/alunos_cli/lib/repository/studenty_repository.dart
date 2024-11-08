import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/students.dart';

class StudentyRepository {
  Future<List<Student>> findByAll() async {
    final studentResult =
        await http.get(Uri.parse('http://localhost:3080/students'));

    if (studentResult != 200) {
      throw Exception('Deu erro aqui');
    }

    final studentsData = jsonDecode(studentResult.body);

    return studentsData.map<Student>((student) {
      return Student.fromMap(student);
    }).toList();
  }

  Future<Student> findById(int id) async {
    final studentResult =
        await http.get(Uri.parse('http://localhost:3080/students/$id'));

    if (studentResult != 200) {
      throw Exception();
    }

    if (studentResult.body == '{}') {
      throw Exception();
    }

    return Student.fromJson(studentResult.body);
  }

  // Future<void> insert(Student student) {}

  // Future<void> update(Student student) {}

  // Future<void> deleteById(int id) {}
}
