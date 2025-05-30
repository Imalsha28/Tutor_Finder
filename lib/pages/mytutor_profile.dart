import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MytutorProfile extends StatefulWidget {
  @override
  _MytutorProfileState createState() => _MytutorProfileState();
}

class _MytutorProfileState extends State<MytutorProfile> {
  bool isLoading = true;
  Map<String, dynamic>? tutorData;

  @override
  void initState() {
    super.initState();
    checkTutorProfile();
  }

  Future<void> checkTutorProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        // Get user name from 'users' collection using UID
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists && userDoc.data()!.containsKey('name')) {
          String userName = userDoc['name'];

          // Match tutor collection using name
          final query = await FirebaseFirestore.instance
              .collection('tutors')
              .where('name', isEqualTo: userName)
              .limit(1)
              .get();

          if (query.docs.isNotEmpty) {
            setState(() {
              tutorData = query.docs.first.data();
              isLoading = false;
            });
          } else {
            setState(() {
              tutorData = null;
              isLoading = false;
            });
          }
        } else {
          // No name found in users collection
          setState(() {
            tutorData = null;
            isLoading = false;
          });
        }
      } catch (e) {
        print("Error: $e");
        setState(() {
          tutorData = null;
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("My Tutor Profile")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tutor Profile"),
      ),
      body: tutorData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don’t have a tutor profile yet."),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tutorRegister');
                    },
                    child: Text("Upgrade as Tutor"),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("👤 Name: ${tutorData!['name']}"),
                  Text("📚 Subject: ${tutorData!['subject']}"),
                  Text("📍 Location: ${tutorData!['location']}"),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/editTutorProfile',
                        arguments: tutorData,
                      );
                    },
                    child: Text("Edit Profile"),
                  ),
                ],
              ),
            ),
    );
  }
}
