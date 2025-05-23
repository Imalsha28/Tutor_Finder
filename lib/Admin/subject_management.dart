import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_1/Admin/coustom_drawer.dart';
import 'package:project_1/pages/authentication/database.dart';
import 'package:random_string/random_string.dart';

class SubjectManagement extends StatefulWidget {
  const SubjectManagement({super.key});

  @override
  State<SubjectManagement> createState() => _SubjectManagementState();
}

class _SubjectManagementState extends State<SubjectManagement> {
  TextEditingController subjectnameController = TextEditingController();

  Future<void> uploadSubject() async {
    String name = subjectnameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter a Subject name")));
      return;
    }
    String id = randomAlphaNumeric(10);
    Map<String, dynamic> addSubject = {
      'id': id,
      'name': name,
      'createdAt': Timestamp.now(),
    };
    await DatabaseMethods().addSubject(id, addSubject);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text("Subject has been uploaded successfully"),
    ));
    subjectnameController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TutorHive',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Subject',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: subjectnameController,
                decoration: InputDecoration(
                  labelText: "Subject Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: uploadSubject,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'All Subjects',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('subjects')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const CircularProgressIndicator();

                  final subjects = snapshot.data!.docs;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      var subject = subjects[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 136, 91, 214),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.school,
                                      color: Colors.white, size: 48),
                                  const SizedBox(height: 12),
                                  Text(
                                    subject['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () async {
                                  bool confirm = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Delete Subject"),
                                      content: const Text(
                                          "Are you sure you want to delete this subject?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text("Delete",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirm) {
                                    await FirebaseFirestore.instance
                                        .collection('subjects')
                                        .doc(subject.id)
                                        .delete();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Subject deleted successfully"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: const Icon(Icons.delete,
                                    color: Color.fromARGB(255, 232, 37, 37)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
