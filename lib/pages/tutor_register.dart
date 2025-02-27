import 'package:flutter/material.dart';

class TutorRegister extends StatefulWidget {
  const TutorRegister({super.key});

  @override
  State<TutorRegister> createState() => _TutorRegisterState();
}

class _TutorRegisterState extends State<TutorRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController teachingExpController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController academicExpController = TextEditingController();

  String selectedLocation = "Select Location";
  String selectedCity = "Select City";
  String tuitionType = "Online";
  String tuitionLevel = "O Level";
  String tuitionMedium = "English";
  String feeRange = "Monthly";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Create profile as a Tutor"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Personal Details
              const Text(
                "Personal Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildInputField("Name", Icons.person, nameController),
              _buildInputField("Email", Icons.email, emailController),
              _buildInputField("Phone", Icons.phone, phoneController),
              _buildDropdownField(
                label: "Location",
                icon: Icons.location_on,
                value: selectedLocation,
                items: ["Select Location", "Colombo", "Galle", "Kandy"],
                onChanged: (value) => setState(() => selectedLocation = value!),
              ),
              _buildDropdownField(
                label: "City",
                icon: Icons.location_city,
                value: selectedCity,
                items: ["Select City", "Colombo", "Galle", "Kandy"],
                onChanged: (value) => setState(() => selectedCity = value!),
              ),
              _buildInputField("Your Teaching Experience", Icons.school,
                  teachingExpController),
              _buildInputField(
                  "Your highest Education", Icons.book, educationController),
              const SizedBox(height: 20),

              // Section: Tuition Details
              const Text(
                "Tuition Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Tuition Type: Online or In Person
              _buildToggleButtons(
                title: "Tuition Type",
                options: ["Online", "In Person"],
                selectedOption: tuitionType,
                onSelected: (value) => setState(() => tuitionType = value),
              ),
              const SizedBox(height: 10),
              // Level: O Level or A Level
              _buildToggleButtons(
                title: "Level",
                options: ["O Level", "A Level"],
                selectedOption: tuitionLevel,
                onSelected: (value) => setState(() => tuitionLevel = value),
              ),
              const SizedBox(height: 10),
              // Tuition Medium: English, Sinhala, Tamil
              _buildToggleButtons(
                title: "Tuition Medium",
                options: ["English", "Sinhala", "Tamil"],
                selectedOption: tuitionMedium,
                onSelected: (value) => setState(() => tuitionMedium = value),
              ),
              const SizedBox(height: 10),

              // Fees Range
              const Text(
                "Fees Range",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  DropdownButton<String>(
                    value: feeRange,
                    onChanged: (String? newValue) {
                      setState(() {
                        feeRange = newValue!;
                      });
                    },
                    items: ["Monthly", "Hourly"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // TextArea for Academic Experience
              const Text(
                "Write about Academic Experience",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: academicExpController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter your academic experience...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons: Cancel and Create
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle 'Create' logic
                        print("Profile Created!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method: Input Field
  Widget _buildInputField(
      String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // Helper Method: Dropdown Field
  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  // Helper Method: Toggle Buttons
  Widget _buildToggleButtons({
    required String title,
    required List<String> options,
    required String selectedOption,
    required void Function(String) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: options.map((option) {
            return Expanded(
              child: GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedOption == option
                        ? Colors.deepPurple
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    option,
                    style: TextStyle(
                      color: selectedOption == option
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
