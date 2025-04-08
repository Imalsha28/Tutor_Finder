import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';

class TutorManagement extends StatefulWidget {
  const TutorManagement({super.key});

  @override
  State<TutorManagement> createState() => _TutorManagementState();
}

class _TutorManagementState extends State<TutorManagement> {
  final List<Map<String, String>> tutors = [
    {"name": "Bruce Wayne", "subject": "Maths", "level": "A/L"},
    {"name": "Clark Kent", "subject": "Physics", "level": "O/L"},
    {"name": "Diana Prince", "subject": "Biology", "level": "A/L"},
  ];

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
              Text(
                'Tutor Management',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tutors.length,
                itemBuilder: (context, index) {
                  return TutorCard(
                    name: tutors[index]["name"]!,
                    subject: tutors[index]["subject"]!,
                    level: tutors[index]["level"]!,
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

// Card Widget for Tutor
class TutorCard extends StatelessWidget {
  final String name;
  final String subject;
  final String level;

  const TutorCard(
      {super.key,
      required this.name,
      required this.subject,
      required this.level});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Subject: $subject'),
                  Text('Level: $level'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Done', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
