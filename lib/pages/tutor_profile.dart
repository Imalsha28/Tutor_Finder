import 'package:flutter/material.dart';
import 'package:project_1/pages/tutor.dart';

class TutorProfile extends StatelessWidget {
  const TutorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutors Profile"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Filters Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterButton(label: "Filters", onPressed: () {}),
                  FilterButton(label: "Location", onPressed: () {}),
                  FilterButton(label: "Fees", onPressed: () {}),
                  FilterButton(label: "Clear", onPressed: () {}),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Number of profiles
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tutor()),
                    );
                  },
                  child: TutorCard(
                    name: "Tutor $index",
                    subjects: "Maths, Science",
                    tuitionType: "Online / In-Person",
                    grade: "Grade 6-8",
                    monthlyFees: "Rs. 2000 / Month",
                    description: "Experienced tutor with 5 years of teaching.",
                    onFavoriteTap: () {
                      // Handle favorite button tap
                      print("Favorited Tutor $index");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

class TutorCard extends StatelessWidget {
  final String name;
  final String subjects;
  final String tuitionType;
  final String grade;
  final String monthlyFees;
  final String description;
  final VoidCallback onFavoriteTap;

  const TutorCard({
    super.key,
    required this.name,
    required this.subjects,
    required this.tuitionType,
    required this.grade,
    required this.monthlyFees,
    required this.description,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
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
            // Profile Image
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/tutor1.jpg'), // Replace with actual image URL
            ),
            const SizedBox(width: 16),
            // Tutor Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(subjects),
                  Text(tuitionType),
                  Text(grade),
                  Text(monthlyFees),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Favorite Button
            IconButton(
              onPressed: onFavoriteTap,
              icon: const Icon(Icons.favorite_border, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
