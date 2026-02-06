import 'package:flutter/material.dart';

class TrainingSopScreen extends StatelessWidget {
  const TrainingSopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training & SOP')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Sales SOP'),
            subtitle: Text('Updated Jan 2026'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('HR Policies'),
            subtitle: Text('Attendance & Leave'),
          ),
        ],
      ),
    );
  }
}
