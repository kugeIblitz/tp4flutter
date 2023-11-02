import 'package:flutter/material.dart';
import 'widgets/studentList.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentListPage(),
    );
  }
}
