import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: Column(
        children: const [
          AttendanceDatePicker(),
          Expanded(child: AttendanceList()),
        ],
      ),
    );
  }
}

class AttendanceDatePicker extends StatelessWidget {
  const AttendanceDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: OutlinedButton.icon(
        icon: const Icon(Icons.date_range),
        label: const Text('Select Date'),
        onPressed: () {},
      ),
    );
  }
}

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        AttendanceTile(name: 'Amit', status: 'Present'),
        AttendanceTile(name: 'Neha', status: 'WFH'),
        AttendanceTile(name: 'Rohit', status: 'Absent'),
      ],
    );
  }
}

class AttendanceTile extends StatelessWidget {
  final String name;
  final String status;

  const AttendanceTile({super.key, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = status == 'Present'
        ? Colors.green
        : status == 'WFH'
        ? Colors.orange
        : Colors.red;

    return Card(
      child: ListTile(
        title: Text(name),
        trailing: Chip(
          label: Text(status),
          backgroundColor: color.withOpacity(0.15),
          labelStyle: TextStyle(color: color),
        ),
      ),
    );
  }
}
