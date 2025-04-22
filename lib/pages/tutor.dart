import 'package:flutter/material.dart';
import 'package:project_1/models/tutor_model.dart';

class Tutor extends StatefulWidget {
  const Tutor({super.key});

  @override
  State<Tutor> createState() => _TutorState();
}

class _TutorState extends State<Tutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Tutor Profile'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.deepPurple.shade100,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/tutor.png'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Imalsha Wanigasooriya',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'English',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
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
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow(Icons.school, 'O Level'),
                      const Divider(height: 24),
                      _buildDetailRow(Icons.location_on, 'Colombo'),
                      const Divider(height: 24),
                      _buildDetailRow(Icons.videocam, 'Online'),
                      const Divider(height: 24),
                      _buildDetailRow(Icons.money, 'Rs. 1500 / Month'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Schedule Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Available Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Days Selection
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _ScheduleDay(day: 'Mo'),
                    _ScheduleDay(day: 'Tu'),
                    _ScheduleDay(day: 'We', selected: true),
                    _ScheduleDay(day: 'Th'),
                    _ScheduleDay(day: 'Fr'),
                    _ScheduleDay(day: 'Sa'),
                    _ScheduleDay(day: 'Su'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Time Slots
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _TimeSlot(time: '8:00 AM'),
                  _TimeSlot(time: '10:00 AM', selected: true),
                  _TimeSlot(time: '2:00 PM'),
                  _TimeSlot(time: '4:00 PM'),
                  _TimeSlot(time: '6:00 PM'),
                  _TimeSlot(time: '8:00 PM'),
                ],
              ),
              const SizedBox(height: 24),

              // Contact Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      color: Colors.green,
                      icon: Icons.call,
                      label: 'Call',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      color: Colors.green,
                      icon: Icons.message,
                      label: 'WhatsApp',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      color: Colors.deepPurple,
                      icon: Icons.email,
                      label: 'Message',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Reviews Button
              OutlinedButton.icon(
                icon: const Icon(Icons.star_rate_rounded, color: Colors.amber),
                label: const Text('4.8 (128 Reviews)'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
              ),
            ],
          ),
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

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple.shade700),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onPressed: () {},
    );
  }
}

class _ScheduleDay extends StatelessWidget {
  final String day;
  final bool selected;

  const _ScheduleDay({required this.day, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: selected ? Colors.deepPurple : Colors.grey.shade100,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    selected ? Colors.deepPurple.shade300 : Colors.transparent,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (selected)
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}

class _TimeSlot extends StatelessWidget {
  final String time;
  final bool selected;

  const _TimeSlot({required this.time, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.deepPurple : null,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? Colors.deepPurple : Colors.grey.shade300,
        ),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
