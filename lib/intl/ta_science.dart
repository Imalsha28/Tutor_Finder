import 'package:flutter/material.dart';

class TaScience extends StatelessWidget {
  const TaScience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ஆசிரியர்களின் சுயவிவரம்"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {},
              child: _buildTutorCard(
                name: "உபுல்",
                subject: "அறிவியல்",
                type: "ஆன்லைன்",
                level: "ஒரு நிலை",
                fee: "1400",
                imagePath: 'assets/user1.png',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: _buildTutorCard(
                name: "சுபா",
                subject: "அறிவியல்",
                type: "தனிப்பட்ட முறையில்",
                level: "ஓ நிலை",
                fee: "1200",
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
                  Text("Monthly Fee: $fee"),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
