import 'package:flutter/material.dart';
import '../studentApi.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String dob = '';
  String address = '';
  String math = '';
  String java = '';
  String flutter = '';

  final StudentApiService apiService = StudentApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Student'),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s date of birth';
                }
                return null;
              },
              onSaved: (value) {
                dob = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
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
              decoration: const InputDecoration(labelText: 'Math Note'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s math note';
                }
                return null;
              },
              onSaved: (value) {
                math = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Java Note'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s Java note';
                }
                return null;
              },
              onSaved: (value) {
                java = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'flutter Note'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the student\'s flutter note';
                }
                return null;
              },
              onSaved: (value) {
                flutter = value!;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  _formKey.currentState!.reset();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Student added successfully!'),
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
