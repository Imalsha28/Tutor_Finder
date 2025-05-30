import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateMytute extends StatefulWidget {
  final Map<String, dynamic> tutorData;

  const UpdateMytute({super.key, required this.tutorData});

  @override
  State<UpdateMytute> createState() => _EditTutorProfileState();
}

class _EditTutorProfileState extends State<UpdateMytute> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController subjectController;
  late TextEditingController locationController;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.tutorData['name']);
    subjectController =
        TextEditingController(text: widget.tutorData['subject']);
    locationController =
        TextEditingController(text: widget.tutorData['location']);
  }

  Future<void> saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isSaving = true;
    });

    try {
      // Get the document ID of the tutor profile
      final query = await FirebaseFirestore.instance
          .collection('tutors')
          .where('name', isEqualTo: widget.tutorData['name'])
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        final docId = query.docs.first.id;

        await FirebaseFirestore.instance
            .collection('tutors')
            .doc(docId)
            .update({
          'name': nameController.text.trim(),
          'subject': subjectController.text.trim(),
          'location': locationController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tutor profile not found')),
        );
      }
    } catch (e) {
      print("Update error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    }

    setState(() {
      isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Tutor Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isSaving
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "Name"),
                      validator: (value) =>
                          value!.isEmpty ? "Name can't be empty" : null,
                    ),
                    TextFormField(
                      controller: subjectController,
                      decoration: const InputDecoration(labelText: "Subject"),
                      validator: (value) =>
                          value!.isEmpty ? "Subject can't be empty" : null,
                    ),
                    TextFormField(
                      controller: locationController,
                      decoration: const InputDecoration(labelText: "Location"),
                      validator: (value) =>
                          value!.isEmpty ? "Location can't be empty" : null,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: saveChanges,
                      child: const Text("Save Changes"),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
