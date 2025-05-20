import 'package:flutter/material.dart';
import 'package:project_1/pages/pick/alex.dart';
import 'package:project_1/pages/pick/lumi.dart';

class Sci extends StatelessWidget {
  const Sci({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutors Profiles"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // First Card - Ms. Lumi
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Lumi()));
              },
              child: _buildTutorCard(
                name: "Lumi Wijesekara",
                subject: "Science",
                type: "Online",
                level: "A Level",
                fee: "1400",
                imagePath: 'assets/tutor1.jpg',
              ),
            ),

            // Second Card - Mr. Alex
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Alex()));
              },
              child: _buildTutorCard(
                name: "Alex Steffan",
                subject: "Science",
                type: "In Person",
                level: "O Level",
                fee: "1200",
                imagePath: 'assets/tutor1.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorCard({
    required String name,
    required String subject,
    required String type,
    required String level,
    required String fee,
    required String imagePath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(subject),
                  Text(type),
                  Text(level),
                  Text("Monthly Fee: $fee"),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Add favorite logic
              },
              icon: const Icon(Icons.favorite_border, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
