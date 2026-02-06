import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        _QuickAction(icon: Icons.people, label: 'Leads'),
        _QuickAction(icon: Icons.upload_file, label: 'Upload Docs'),
        _QuickAction(icon: Icons.chat, label: 'Chat'),
        _QuickAction(icon: Icons.bar_chart, label: 'Reports'),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.indigo.withOpacity(0.1),
            child: Icon(icon, color: Colors.indigo),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
