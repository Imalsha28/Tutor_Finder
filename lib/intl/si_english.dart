import 'package:flutter/material.dart';

class SiEnglish extends StatelessWidget {
  const SiEnglish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ගුරුවරුන්ගේ පැතිකඩ"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {},
              child: _buildTutorCard(
                name: "කලනි දොඩම්තැන්න",
                subject: "ඉංග්රීසි",
                type: "ඔන්ලයින්",
                level: "O ලෙවල්",
                fee: "1400",
                imagePath: 'assets/user1.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorCard({
    required String name,
    required String subject,
    required String type,
    required String level,
    required String fee,
    required String imagePath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(subject),
                  Text(type),
                  Text(level),
                  Text("මාසිකව: $fee"),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Add favorite logic
              },
              icon: const Icon(Icons.favorite_border, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
