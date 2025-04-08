import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
            const SizedBox(height: 15),
            // User Name
            const Text(
              'Noah Lee',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Fields
            _buildProfileField(Icons.person, 'Username'),
            const SizedBox(height: 10),
            _buildProfileField(Icons.phone, '+123 456 7890'),
            const SizedBox(height: 10),
            _buildProfileField(Icons.email, 'noahlee@example.com'),

            const SizedBox(height: 30),
            // Logout Button
            TextButton.icon(
              onPressed: () {
                // Handle logout
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
              // Handle edit action
            },
          ),
        ],
      ),
    );
  }
}
