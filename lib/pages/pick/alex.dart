import 'package:flutter/material.dart';

class Alex extends StatelessWidget {
  const Alex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutor Profile"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/tutor.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              "Alex Steffan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Science",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileButton(Icons.info_outline, 'About'),
                const SizedBox(width: 20),
                _buildProfileButton(Icons.photo_camera_back, 'Photos'),
              ],
            ),

            const SizedBox(height: 20),

            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: Column(
                children: const [
                  InfoRow(icon: Icons.school, text: "A Level"),
                  SizedBox(height: 8),
                  InfoRow(icon: Icons.location_on, text: "Colombo"),
                  SizedBox(height: 8),
                  InfoRow(icon: Icons.wifi, text: "In Person"),
                  SizedBox(height: 8),
                  InfoRow(icon: Icons.payments, text: "Rs. 1200 / Month"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Schedule
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Available Schedule",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
                      .map((day) => Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: day == "Mo"
                                  ? Colors.deepPurple
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(
                                color:
                                    day == "Mo" ? Colors.white : Colors.black,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    timeChip("8:00 AM", selected: true),
                    timeChip("10:00 AM"),
                    timeChip("2:00 PM"),
                    timeChip("4:00 PM"),
                    timeChip("6:00 PM"),
                    timeChip("8:00 PM"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Contact Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                contactButton(Icons.call, "Call"),
                contactButton(Icons.message, "WhatsApp"),
                contactButton(Icons.email, "Message"),
              ],
            ),

            const SizedBox(height: 16),

            // Reviews Button
            OutlinedButton.icon(
              onPressed: () {
                // navigate to reviews
              },
              icon: const Icon(Icons.star_border, color: Colors.deepPurple),
              label: const Text(
                "Reviews",
                style: TextStyle(color: Colors.deepPurple),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.deepPurple),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.deepPurple.shade700),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.deepPurple.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget timeChip(String time, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.deepPurple : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Text(
        time,
        style: TextStyle(color: selected ? Colors.white : Colors.deepPurple),
      ),
    );
  }

  Widget contactButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
