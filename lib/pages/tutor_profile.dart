import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/pages/tutor.dart';
import 'dart:convert';
import 'package:project_1/models/tutor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<TutorModel>> getTutorList() async {
  final prefs = await SharedPreferences.getInstance();
  final String? tutorsString = prefs.getString('tutors');

  if (tutorsString == null) return [];

  List<dynamic> tutorJsonList = jsonDecode(tutorsString);
  return tutorJsonList.map((json) => TutorModel.fromJson(json)).toList();
}

class TutorProfile extends StatefulWidget {
  const TutorProfile({super.key});

  @override
  State<TutorProfile> createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
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
            child: FutureBuilder<List<TutorModel>>(
              future: getTutorList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error loading tutors"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No tutors found"));
                }

                final tutors = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tutors.length,
                  itemBuilder: (context, index) {
                    final tutor = tutors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tutor(),
                          ),
                        );
                      },
                      child: TutorCard(
                        name: tutor.name,
                        subjects: tutor.subjects,
                        location: tutor.location,
                        tuitionType: tutor.tuitionType,
                        grade: tutor.tuitionLevel,
                        monthlyFees: "Rs. ${tutor.monthlyFees} / Month",
                        description: tutor.description,
                        onFavoriteTap: () {
                          print("Favorited ${tutor.name}");
                        },
                      ),
                    );
                  },
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
  final String location;
  final VoidCallback onFavoriteTap;

  const TutorCard({
    super.key,
    required this.name,
    required this.subjects,
    required this.tuitionType,
    required this.grade,
    required this.monthlyFees,
    required this.description,
    required this.location,
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
