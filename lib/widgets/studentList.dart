import 'package:flutter/material.dart';
import '../studentApi.dart';
import './StudentDetailsPage.dart';
import './StudentEditPage.dart';

class StudentListPage extends StatefulWidget {
  final StudentApiService apiService = StudentApiService();

  StudentListPage({Key? key}) : super(key: key);

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  TextEditingController searchController = TextEditingController();
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final data = await widget.apiService.getStudents();
    setState(() {
      students = data;
    });
  }

  List<Student> _filterStudents(String query) {
    if (query.isEmpty) {
      return students;
    }
    return students
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Student List', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear, color: Colors.white),
            onPressed: () {
              searchController.clear();
              setState(() {
                students = _filterStudents('');
              });
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (text) {
                setState(() {
                  students = _filterStudents(text);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search students',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      body: students.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : students.isNotEmpty
              ? ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return GestureDetector(
                      onTap: () {
                        _navigateToStudentDetails(context, student);
                      },
                      child: ListTile(
                        title: Text(student.name),
                        subtitle: Text(student.email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _editStudent(context, student);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              child: const Text('Edit',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(width: 3),
                            ElevatedButton(
                              onPressed: () {
                                _deleteStudent(student.id);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('No students found.')),
    );
  }

  void _deleteStudent(int studentId) {
    widget.apiService.deleteStudent(studentId).then((_) {}).catchError((error) {
      print('Failed to delete student: $error');
    });
  }

  void _navigateToStudentDetails(BuildContext context, Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailsPage(student: student),
      ),
    );
  }

  void _editStudent(BuildContext context, Student student) {
    // Navigate to the student details editing page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentEditPage(student: student),
      ),
    );
  }
}
