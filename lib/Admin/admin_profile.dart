import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';
import 'package:project_1/pages/authentication/sign_in.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TutorHive',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user2.png'),
              ),
              SizedBox(height: 15),

              // Admin Name
              Text(
                'Admin',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              // Admin Role
              Text(
                'Administrator',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              SizedBox(height: 20),

              // Admin Details
              _buildProfileDetail('Email', 'admin@tutorhive.com', Icons.email),
              _buildProfileDetail('Phone', '+94 77 123 4567', Icons.phone),
              _buildProfileDetail(
                  'Joined', '17 March 2025', Icons.calendar_today),

              SizedBox(height: 30),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _actionButton(Icons.edit, 'Edit Profile', Colors.blue, () {
                    // Add Edit Functionality
                  }),
                  SizedBox(width: 20),
                  _actionButton(Icons.logout, 'Logout', Colors.red, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Detail Row
  Widget _buildProfileDetail(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title: $value',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Action Button
  Widget _actionButton(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
