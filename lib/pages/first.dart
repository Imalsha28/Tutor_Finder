import 'package:flutter/material.dart';
import 'package:project_1/intl/bottom.dart';
import 'package:project_1/intl/intlta.dart';
import 'package:project_1/pages/Location.dart';
import 'package:project_1/pages/pick/sci.dart';
import 'package:project_1/pages/tutor_profile.dart';
import 'package:project_1/pages/tutor_register.dart';
import 'package:project_1/pages/view_subject.dart';
import 'package:project_1/intl/intlsi.dart';

class FirstScreen extends StatefulWidget {
  final String userName;

  const FirstScreen({super.key, required this.userName});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String selectedLocation = "Colombo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          'Hi, ${widget.userName}! 👋',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Purple gradient background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade400,
                    Colors.deepPurple.shade700
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: "Search a Tutor",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Dropdown for location
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedLocation,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey),
                            items: <String>[
                              "Matara",
                              "Colombo",
                              "Galle",
                              "Kandy",
                              "Anuradhapura",
                              "Trincomalee",
                              "Jaffna",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLocation = newValue!;
                              });
                              if (newValue == "Set your Location") {
                                // Navigate to the Search Location Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchLocationScreen()),
                                );
                              } else {
                                // Handle other selections (e.g., update selectedLocation)
                                print("Selected location: $newValue");
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          LanguageButton(
                            label: "සිං",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavigationWrapper(child: Intlsi()),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 5),
                          LanguageButton(
                            label: "Eng",
                            onTap: () {},
                          ),
                          const SizedBox(width: 5),
                          LanguageButton(
                            label: "தமி",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavigationWrapper(child: Intlta()),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pick a Subject",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewSubject()));
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // O Level Category Card
                      CategoryCard(
                        label: "Science",
                        icon: Icons.school,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Sci()),
                          );
                        },
                      ),
                      // A Level Category Card
                      CategoryCard(
                        label: "English",
                        icon: Icons.school,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TutorProfile()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Image Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/card1.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Register as a tutor card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorRegister()),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 217, 187, 227)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        // Image
                        Image.asset(
                          'assets/tutor.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Register as a Tutor",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 4, 4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const LanguageButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 197, 182, 222),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style:
            const TextStyle(color: Color.fromARGB(255, 1, 1, 1), fontSize: 14),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade100, Colors.deepPurple.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
