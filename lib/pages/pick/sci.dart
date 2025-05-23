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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          // Filter bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterButton(
                    label: "Filters",
                    onPressed: () {},
                  ),
                  FilterButton(label: "Location", onPressed: () {}),
                  FilterButton(label: "Fees", onPressed: () {}),
                  FilterButton(label: "Clear", onPressed: () {}),
                ],
              ),
            ),
          ),

          // Tutor list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Lumi()));
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Alex()));
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
          ),
        ],
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

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FilterButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
