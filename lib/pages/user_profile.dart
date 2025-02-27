import 'package:flutter/material.dart';
import 'package:project_1/pages/authentication/sign_in.dart';
import 'package:project_1/pages/authentication/sign_up.dart';
import 'package:project_1/pages/tutor_register.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(78.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space between elements
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height: 25), // Top padding to move text down a little
            const Text(
              'Sign in to your account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            const SizedBox(
                height: 20), // Adjusted space between text and buttons

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign Up screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // white background
                foregroundColor: Colors.purple, // purple text
                side: const BorderSide(
                    color: Colors.purple, width: 2), // purple border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Space between buttons

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign In screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // purple background
                foregroundColor: Colors.white, // white text
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
                height: 30), // Space between Sign In and Register buttons

            // Register as a Tutor Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Register as a Tutor screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TutorRegister()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // purple background
                foregroundColor: Colors.white, // white text
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                side: const BorderSide(
                    color: Colors.deepPurple, width: 2), // border color
              ),
              child: const Text(
                'Register As a Tutor',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
