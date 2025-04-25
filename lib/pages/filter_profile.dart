import 'package:flutter/material.dart';
import 'package:project_1/pages/tutor.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_1/models/tutor_model.dart';

class FilterProfile extends StatefulWidget {
  final String selectedCity;
  final String selectedSubject;

  const FilterProfile(
      {super.key, required this.selectedCity, required this.selectedSubject});

  @override
  State<FilterProfile> createState() => _FilterProfileState();
}

class _FilterProfileState extends State<FilterProfile> {
  List<TutorModel> filteredTutor = [];

  @override
  void initState() {
    super.initState();
    _loadAndFilterTutors();
  }

  Future<void> _loadAndFilterTutors() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tutorListString = prefs.getString('tutors');

    if (tutorListString != null) {
      List<dynamic> jsonList = jsonDecode(tutorListString);
      List<TutorModel> allTutors =
          jsonList.map((json) => TutorModel.fromJson(json)).toList();

      setState(() {
        filteredTutor = allTutors.where((tutor) {
          return (widget.selectedCity == "All" ||
                  tutor.city == widget.selectedCity) &&
              (widget.selectedSubject == "All" ||
                  tutor.subjects.contains(widget.selectedSubject));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtered Tutors"),
        backgroundColor: Colors.deepPurple,
      ),
      body: filteredTutor.isEmpty
          ? const Center(child: Text("No tutors found for your criteria 😔"))
          : ListView.builder(
              itemCount: filteredTutor.length,
              itemBuilder: (context, index) {
                final tutor = filteredTutor[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tutor()),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  'assets/tutor1.jpg',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tutor.name,
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "${tutor.subjects} • ${tutor.city}",
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      tutor.tuitionLevel,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(Icons.favorite_border_outlined,
                              color: Colors.deepPurpleAccent),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
