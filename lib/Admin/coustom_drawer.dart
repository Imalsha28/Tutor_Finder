import 'package:flutter/material.dart';
import 'package:project_1/Admin/admin_profile.dart';
import 'package:project_1/Admin/home_admin.dart';
import 'package:project_1/Admin/subject_management.dart';
import 'package:project_1/Admin/tutor_management.dart';
import 'package:project_1/Admin/tutor_reviews.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _drawerItem(context, 'Dashboard', Icons.dashboard, const Dashboard()),
          _drawerItem(context, 'Subject Management', Icons.book,
              const SubjectManagement()),
          _drawerItem(context, 'Tutor Management', Icons.person,
              const TutorManagement()),
          _drawerItem(
              context, 'Tutor Reviews', Icons.star, const TutorReviews()),
          _drawerItem(
              context, 'Profile', Icons.account_circle, const AdminProfile()),
        ],
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
