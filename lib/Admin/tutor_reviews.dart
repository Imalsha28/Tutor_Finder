import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorReviews extends StatefulWidget {
  const TutorReviews({super.key});

  @override
  State<TutorReviews> createState() => _TutorReviewsState();
}

class _TutorReviewsState extends State<TutorReviews> {
// Function to delete reviews
  void _deleteReview(String reviewId) async {
    await FirebaseFirestore.instance
        .collection('reviews')
        .doc(reviewId)
        .delete();
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('reviews').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final review = docs[index];
              final reviewId = review.id; // Using document ID
              final reviewText = review['text']; // The text field of the review

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(reviewText),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteReview(
                              reviewId); // Delete the review using document ID
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
