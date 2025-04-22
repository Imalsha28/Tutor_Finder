import 'package:flutter/material.dart';
import 'package:project_1/pages/first.dart';
import 'package:project_1/pages/tutor_profile.dart';
import 'package:project_1/models/tutor_filter.dart';
import 'package:project_1/pages/filter_profile.dart';

class FindTutor extends StatefulWidget {
  const FindTutor({super.key});

  @override
  State<FindTutor> createState() => _FindTutorState();
}

class _FindTutorState extends State<FindTutor> {
  String selectedCity = "Select City";
  String tuitionType = "Online";
  String tuitionMedium = "English";
  String level = "O Level";
  String time = "Morning";
  String selectedSubject = "Select Subject";
  Set<String> selectedDates = {}; // Tracks selected dates
  double minFee = 0;
  double maxFee = 10000;

  final List<String> cities = [
    "Select City",
    "Kandy",
    "Colombo",
    "Trincomalee",
    "Galle"
  ];
  final List<String> subjects = [
    "Select Subject",
    "Mathematics",
    "Science",
    "English",
  ];
  final List<String> weekdays = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Your Tutor"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FirstScreen(
                        userName: 'Imalsha',
                      )),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City Dropdown
              const Text("City", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedCity,
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),

              // Tuition Type
              const Text("Tuition Type",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildToggleButton("Online", tuitionType == "Online", () {
                    setState(() {
                      tuitionType = "Online";
                    });
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton("In Person", tuitionType == "In Person",
                      () {
                    setState(() {
                      tuitionType = "In Person";
                    });
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Tuition Medium
              const Text("Tuition Medium",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildToggleButton("English", tuitionMedium == "English", () {
                    setState(() {
                      tuitionMedium = "English";
                    });
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton(
                    "සිංහල",
                    tuitionMedium == "සිංහල",
                    () {
                      setState(() {
                        tuitionMedium = "සිංහල";
                      });
                    },
                    fontFamily: 'NotoSansSinhala',
                  ),
                  const SizedBox(width: 8),
                  _buildToggleButton("தமிழ்", tuitionMedium == "தமிழ்", () {
                    setState(() {
                      tuitionMedium = "தமிழ்";
                    });
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Level
              const Text("Level",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildToggleButton("O Level", level == "O Level", () {
                    setState(() {
                      level = "O Level";
                    });
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton("A Level", level == "A Level", () {
                    setState(() {
                      level = "A Level";
                    });
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Subject Dropdown
              const Text("Subject",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedSubject,
                items: subjects.map((String subject) {
                  return DropdownMenuItem<String>(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),

              // Date Section
              const Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: weekdays.map((day) {
                  final isSelected = selectedDates.contains(day);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDates.remove(day);
                        } else {
                          selectedDates.add(day);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        day,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Time
              const Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildToggleButton("Morning", time == "Morning", () {
                    setState(() {
                      time = "Morning";
                    });
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton("Evening", time == "Evening", () {
                    setState(() {
                      time = "Evening";
                    });
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton("Night", time == "Night", () {
                    setState(() {
                      time = "Night";
                    });
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Fee Range
              const Text("Fees Range",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "From",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          minFee = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "To",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          maxFee = double.tryParse(value) ?? 1000;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Reset & Apply Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Reset logic
                      setState(() {
                        selectedCity = "Select City";
                        tuitionType = "Online";
                        tuitionMedium = "English";
                        level = "O Level";
                        selectedSubject = "Select Subject";
                        selectedDates.clear();
                        time = "Morning";
                        minFee = 0;
                        maxFee = 1000;
                      });
                    },
                    child: const Text("RESET"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      //final filter = TutorFilter(
                      //city: selectedCity,
                      //tuitionType: tuitionType,
                      //tuitionMedium: tuitionMedium,
                      //level: level,
                      //subject: selectedSubject,
                      //selectedDates: selectedDates,
                      //time: time,
                      //minFee: minFee,
                      //maxFee: maxFee);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterProfile(
                              selectedCity: selectedCity,
                              selectedSubject: selectedSubject,
                            ),
                          ));
                    },
                    child: const Text("Apply"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap,
      {String? fontFamily}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: fontFamily,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
