import 'package:flutter/material.dart';
import 'find_tutor.dart';
import 'first.dart';
import 'user_profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  // Define the pages for the navigation
  final List<Widget> pages = [
    FirstScreen(
      userName: 'Buthxi',
    ),
    FindTutor(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the selected page
      body: pages[pageIndex],

      // Bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white, // Background color for the main screen
        color: Colors.deepPurple, // Color of the navigation bar
        buttonBackgroundColor:
            Colors.deepPurpleAccent, // Highlighted icon background
        height: 60, // Height of the navigation bar
        index: pageIndex, // Current selected index
        animationDuration:
            const Duration(milliseconds: 300), // Smooth animation
        animationCurve: Curves.easeInOut, // Animation curve
        onTap: (index) {
          setState(() {
            pageIndex = index; // Update the current page
          });
        },
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white), // Home icon
          Icon(Icons.search, size: 30, color: Colors.white), // Find Tutor icon
          Icon(Icons.person, size: 30, color: Colors.white), // Profile icon
        ],
      ),
    );
  }
}
