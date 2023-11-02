import 'dart:convert';

import 'package:http/http.dart' as http;

class StudentApiService {
  final String baseUrl = 'http://10.0.2.2:8000';

  Future<List<Student>> getStudents() async {
    final response = await http.get(Uri.parse('$baseUrl/students'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((student) => Student.fromJson(student)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<Student> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse('$baseUrl/students'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toJson()),
    );

    if (response.statusCode == 201) {
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add student');
    }
  }

  Future<void> deleteStudent(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/students/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete student');
    }
  }
}

class Student {
  final int id;
  final String name;
  final String email;
  final String dob;
  final String address;
  final String math;
  final String java;
  final String flutter;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.address,
    required this.math,
    required this.java,
    required this.flutter,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      dob: json['dob'],
      address: json['address'],
      math: json['math'],
      java: json['java'],
      flutter: json['flutter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'dob': dob,
      'address': address,
      'math': math,
      'java': java,
      'flutter': flutter,
    };
  }
}
