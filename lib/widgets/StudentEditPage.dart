import 'package:flutter/material.dart';
import '../studentApi.dart';

class StudentEditPage extends StatefulWidget {
  final Student student;

  const StudentEditPage({Key? key, required this.student}) : super(key: key);

  @override
  _StudentEditPageState createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String dob = '';
  String address = '';
  String math = '';
  String java = '';
  String flutter = '';

  @override
  void initState() {
    super.initState();
    // Pre-fill the form fields with the student's details
    name = widget.student.name;
    email = widget.student.email;
    dob = widget.student.dob;
    address = widget.student.address;
    math = widget.student.math;
    java = widget.student.java;
    flutter = widget.student.flutter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Image.asset(
              'assets/image.jpg',
              height: 150,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              initialValue: name, // Pre-filled name
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s name';
                }
                return null;
              },
              onSaved: (value) {
                name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              initialValue: email, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s email';
                }
                return null;
              },
              onSaved: (value) {
                email = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              initialValue: dob, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s dob';
                }
                return null;
              },
              onSaved: (value) {
                dob = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'address'),
              initialValue: address, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s address';
                }
                return null;
              },
              onSaved: (value) {
                address = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'address'),
              initialValue: address, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s address';
                }
                return null;
              },
              onSaved: (value) {
                address = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'math'),
              initialValue: math, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s math';
                }
                return null;
              },
              onSaved: (value) {
                math = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'java'),
              initialValue: java, // Pre-filled email
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s java';
                }
                return null;
              },
              onSaved: (value) {
                java = value!;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  _formKey.currentState!.reset();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Student updated successfully!'),
                    ),
                  );
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
