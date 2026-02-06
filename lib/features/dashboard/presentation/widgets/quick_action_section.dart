import 'package:flutter/material.dart';

class QuickActionSection extends StatefulWidget {
  const QuickActionSection({super.key});

  @override
  State<QuickActionSection> createState() => _QuickActionSectionState();
}

class _QuickActionSectionState extends State<QuickActionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            ActionButton(icon: Icons.person_add, label: 'Add Lead'),
            ActionButton(icon: Icons.upload_file, label: 'Upload Docs'),
            ActionButton(icon: Icons.message, label: 'WhatsApp'),
            ActionButton(icon: Icons.receipt_long, label: 'Invoice'),
            ActionButton(icon: Icons.people_alt, label: 'HR Panel'),
            ActionButton(icon: Icons.analytics, label: 'Reports'),
          ],
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.indigo),
      label: Text(label),
    );
  }
}
