import 'package:flutter/material.dart';
import '../studentApi.dart';
import './StudentEditPage.dart'; // Import the edit page

class StudentDetailsPage extends StatelessWidget {
  final Student student;

  const StudentDetailsPage({Key? key, required this.student}) : super(key: key);

  void _editStudent(BuildContext context) {
    // Define the function to navigate to the edit page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentEditPage(
          student: student,
        ), // Pass the student to the edit page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit), // Edit button
            onPressed: () => _editStudent(context), // Call the edit function
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow("Name", student.name, 24),
            _buildDetailRow("Email", student.email, 18),
            _buildDetailRow("Date of Birth", student.dob, 18),
            _buildDetailRow("Address", student.address, 18),
            _buildDetailRow("Math", student.math, 18),
            _buildDetailRow("Java", student.java, 18),
            _buildDetailRow("Flutter", student.flutter, 18),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ',
              style:
                  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: fontSize)),
          ),
        ],
      ),
    );
  }
}
