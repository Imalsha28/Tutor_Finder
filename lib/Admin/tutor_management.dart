import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorManagement extends StatefulWidget {
  const TutorManagement({super.key});

  @override
  State<TutorManagement> createState() => _TutorManagementState();
}

class _TutorManagementState extends State<TutorManagement> {
  Future<List<Map<String, dynamic>>> fetchTutors() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('tutors').get();

    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'name': doc['name'] ?? 'N/A',
        'subject': doc['subject'] ?? 'N/A',
        'location': doc['location'] ?? 'N/A',
      };
    }).toList();
  }

  Future<void> deleteTutor(String id) async {
    await FirebaseFirestore.instance.collection('tutors').doc(id).delete();
    setState(() {}); // Refresh after delete
  }

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchTutors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final tutors = snapshot.data ?? [];

          if (tutors.isEmpty) {
            return Center(child: Text('No tutors found.'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: tutors.map((tutor) {
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoRow('👤 Name:', tutor['name']),
                        _infoRow('📚 Subject:', tutor['subject']),
                        _infoRow('📍 Location:', tutor['location']),
                        _infoRow('💰 Fee:', '${tutor['fee']}'),
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                _showDeleteDialog(tutor['id'], tutor['name']),
                            icon: Icon(Icons.delete, size: 18),
                            label: Text('Delete'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(String id, String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Delete Tutor'),
        content: Text('Are you sure you want to delete "$name"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await deleteTutor(id);
            },
            child: Text('Delete'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
