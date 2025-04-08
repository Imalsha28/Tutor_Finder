import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';

class SubjectManagement extends StatefulWidget {
  const SubjectManagement({super.key});

  @override
  State<SubjectManagement> createState() => _SubjectManagementState();
}

class _SubjectManagementState extends State<SubjectManagement> {
  final TextEditingController _subjectNameControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              // Title
              Text(
                'Subject Management',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Add Subject Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Subject',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      // Subject Name Input
                      TextField(
                        controller: _subjectNameControler,
                        decoration: InputDecoration(
                          labelText: "Subject Name:",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),

                      // File Upload (Mockup)
                      Row(
                        children: [
                          Text("Image/Logo : "),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Choose File"),
                          ),
                          Text("  No File Chosen"),
                        ],
                      ),
                      SizedBox(height: 15),

                      // Save Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Save logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: Text("Save",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Subject List
              Text(
                'All Subjects',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Table/List
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("SubID", style: _headerStyle())),
                          Expanded(child: Text("Name", style: _headerStyle())),
                          Expanded(
                              child: Text("Action", style: _headerStyle())),
                        ],
                      ),
                    ),
                    Divider(),

                    // Dummy Subject List (Replace with your data)
                    for (int i = 0; i < 7; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text("01")),
                            Expanded(child: Text("Science")),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      // Edit logic
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      // Delete logic
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    // See More Link
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            // Load more subjects
                          },
                          child: Text(
                            "See more",
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _headerStyle() {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  }
}
