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
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(tutor.name),
                    subtitle: Text("${tutor.subjects} • ${tutor.city}"),
                    trailing: Text(tutor.tuitionLevel),
                    onTap: () {
                      // Navigate to detail if needed
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tutor()));
                    },
                  ),
                );
              },
            ),
    );
  }
}
