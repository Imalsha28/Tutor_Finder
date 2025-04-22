import 'package:flutter/material.dart';

class Sci extends StatelessWidget {
  const Sci({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutors Profiles"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // First Card - Ms. Lumi
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/tutor1.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Ms. Lumi ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Science"),
                          Text("Online"),
                          Text("A Level"),
                          Text("Monthly Fee: 1400"),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add favorite logic
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),

            // Second Card - Mr. Alex
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/tutor1.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Mr. Alex",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Science"),
                          Text("Offline"),
                          Text("O Level"),
                          Text("Monthly Fee: 1200"),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add favorite logic
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
