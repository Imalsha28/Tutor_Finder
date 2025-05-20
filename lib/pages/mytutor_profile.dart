import 'package:flutter/material.dart';

class MytutorProfile extends StatelessWidget {
  const MytutorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'My Tutor Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),

            // Profile image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/student.jpg'),
            ),
            const SizedBox(height: 12),

            // Name and About
            const Text(
              'Imalsha Wanigasooriya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Text(
                "Hi I'm Imalsha Wanigasooriya, Good Qualified Tutor in industry. I'm from Kottawa.",
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.4),
              ),
            ),

            const SizedBox(height: 20),

            // Info Rows
            _infoRow("Subjects", "Art"),
            _infoRow("Grade Level", "O Level"),
            _infoRow("Tuition Type", "Online"),
            _infoRow("Tuition medium", "English"),
            _infoRow("Location", "Kottawa"),

            const SizedBox(height: 14),

            // Experience & Fee
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _boxText("2 year Teaching Exp"),
                const SizedBox(width: 10),
                _boxText("Rs.2000 | Monthly"),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(thickness: 1),
            const SizedBox(height: 10),

            // Schedule
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Schedule",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 14),

            // Date Section
            _sectionLabel("Date"),
            const SizedBox(height: 10),
            _buildDateRow(["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                selectedDays: ["Su"]),

            const SizedBox(height: 25),

            // Time Section
            _sectionLabel("Time"),
            const SizedBox(height: 10),
            _buildTimeRow(["Morning", "Evening", "Night"],
                selectedTimes: ["Morning"]),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _boxText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }

  Widget _buildDateRow(List<String> days, {List<String>? selectedDays}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        final isSelected = selectedDays?.contains(day) ?? false;
        return CircleAvatar(
          radius: 20,
          backgroundColor: isSelected ? Colors.deepPurple : Colors.white,
          child: Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeRow(List<String> times, {List<String>? selectedTimes}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.map((time) {
        final isSelected = selectedTimes?.contains(time) ?? false;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepPurple : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              if (isSelected)
                const BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
            ],
          ),
          child: Text(
            time,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
