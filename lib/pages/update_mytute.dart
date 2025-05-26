import 'package:flutter/material.dart';

class UpdateMytute extends StatelessWidget {
  const UpdateMytute({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: 'Imalsha Wanigasooriya');
    final TextEditingController aboutController =
        TextEditingController(text: "Hi I'm Imalsha, Good Qualified Tutor");
    final TextEditingController expController =
        TextEditingController(text: '2 year Experience');
    final TextEditingController feeController =
        TextEditingController(text: 'Rs.1500 | Monthly');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: const Text(
          'Edit Tutor Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            // Profile image
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user1.png'),
            ),
            const SizedBox(height: 12),

            // Name field
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // About field
            TextFormField(
              controller: aboutController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'About',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdowns
            _buildDropdown(
                'Subject', 'English', ['English', 'Math', 'Science']),
            _buildDropdown('Grade Level', 'O Level', ['O Level', 'A Level']),
            _buildDropdown('Tuition Type', 'Online', ['Online', 'Physical']),
            _buildDropdown('Medium', 'English', ['English', 'Sinhala']),
            _buildDropdown(
                'Location', 'Colombo', ['Colombo', 'Galle', 'Kandy']),

            const SizedBox(height: 14),

            // Experience & Fee
            TextFormField(
              controller: expController,
              decoration: const InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: feeController,
              decoration: const InputDecoration(
                labelText: 'Fee',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),

            // Schedule
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Schedule",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 14),

            _sectionLabel("Date"),
            const SizedBox(height: 10),
            _buildDateRow(["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                selectedDays: ["Mo"]),

            const SizedBox(height: 25),

            _sectionLabel("Time"),
            const SizedBox(height: 10),
            _buildTimeRow(["Morning", "Evening", "Night"],
                selectedTimes: ["Morning"]),

            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: const Text("Save Profile",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String initial, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: initial,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {},
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
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
