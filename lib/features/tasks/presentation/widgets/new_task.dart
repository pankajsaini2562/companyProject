import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B2C83),
        title: const Text("New Task", style: TextStyle(color: Colors.white)),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textField("Enter Task title"),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _textField("2:00 PM")),
                const SizedBox(width: 12),
                Expanded(child: _textField("Friday")),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              "Priority:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            Row(
              children: const [
                PriorityOption(color: Colors.red, label: "HIGH"),
                SizedBox(width: 12),
                PriorityOption(color: Colors.green, label: "MEDIUM"),
                SizedBox(width: 12),
                PriorityOption(color: Colors.blue, label: "LOW"),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Client Information:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            _textField("Name"),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _textField("Age")),
                const SizedBox(width: 12),
                Expanded(child: _textField("Gender")),
              ],
            ),
            const SizedBox(height: 12),

            _textField("Email"),
            const SizedBox(height: 12),

            _textField("Service Required"),
            const SizedBox(height: 12),

            _textField("Details", maxLines: 4),
          ],
        ),
      ),
    );
  }

  Widget _textField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PriorityOption extends StatelessWidget {
  final Color color;
  final String label;

  const PriorityOption({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
