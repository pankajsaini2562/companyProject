import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            _ProfileField(label: 'Name', value: 'Rahul Sharma'),
            _ProfileField(label: 'Email', value: 'rahul@gmail.com'),
            _ProfileField(label: 'Role', value: 'Sales Executive'),
            _ProfileField(label: 'Phone', value: '+91 98765 43210'),
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(label), subtitle: Text(value));
  }
}
