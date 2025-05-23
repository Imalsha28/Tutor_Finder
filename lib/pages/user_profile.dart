import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_1/pages/authentication/sign_in.dart';

import 'package:project_1/pages/befor_mytute.dart';
import 'package:project_1/pages/mytutor_profile.dart';
import 'package:project_1/pages/update_mytute.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name = "Loading...";
  String email = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          name = userDoc["Name"] ?? "No Name";
          email = userDoc["email"] ?? "No Email";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/student.jpg'),
            ),
            SizedBox(height: 15),
            // User Name
            Text(
              name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Profile Fields
            _buildProfileField(Icons.person, name),
            const SizedBox(height: 10),
            _buildProfileField(Icons.phone, 'Add phone number'),
            const SizedBox(height: 10),
            _buildProfileField(Icons.email, email),

            SizedBox(height: 20),
            _buildDualNavigationTile(
                icon: Icons.visibility,
                text: "My Tutor Profile",
                onTileTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MytutorProfile()));
                },
                onArrowTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BeforMytute()));
                }),
            SizedBox(height: 10),
            _buildDualNavigationTile(
              icon: Icons.edit,
              text: "Update Your Profile",
              onTileTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UpdateMytute()));
              },
              onArrowTap: () {},
            ),

            const SizedBox(height: 30),
            // Logout Button
            TextButton.icon(
              onPressed: () {
                _auth.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Profile Fields
  Widget _buildProfileField(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: () {
              //  edit action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDualNavigationTile({
    required IconData icon,
    required String text,
    required VoidCallback onTileTap,
    required VoidCallback onArrowTap,
  }) {
    return GestureDetector(
      onTap: onTileTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: onArrowTap,
            ),
          ],
        ),
      ),
    );
  }
}
