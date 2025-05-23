import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_1/intl/intlsi.dart';
import 'package:project_1/intl/si_findtute.dart';
import 'package:project_1/intl/si_userpro.dart';

class NavigationWrapper extends StatefulWidget {
  final Widget child;

  const NavigationWrapper({super.key, required this.child});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        buttonBackgroundColor: Colors.deepPurpleAccent,
        height: 60,
        index: pageIndex,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });

          // Optional: Navigate to different screens based on index
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationWrapper(
                    child: Intlsi()), // Replace with correct page
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationWrapper(child: SiFindtute()),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationWrapper(child: SiUserpro()),
              ),
            );
          }
        },
      ),
    );
  }
}
