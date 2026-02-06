import 'package:flutter/material.dart';

class EmployeeDirectoryScreen extends StatelessWidget {
  const EmployeeDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Directory')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          EmployeeTile(name: 'Amit Sharma', department: 'Sales'),
          EmployeeTile(name: 'Neha Verma', department: 'HR'),
          EmployeeTile(name: 'Rohit Singh', department: 'Operations'),
        ],
      ),
    );
  }
}

class EmployeeTile extends StatelessWidget {
  final String name;
  final String department;

  const EmployeeTile({super.key, required this.name, required this.department});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name),
        subtitle: Text(department),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
