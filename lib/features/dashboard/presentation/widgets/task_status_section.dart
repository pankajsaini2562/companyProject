import 'package:flutter/material.dart';

class TaskStatusSection extends StatefulWidget {
  const TaskStatusSection({super.key});

  @override
  State<TaskStatusSection> createState() => _TaskStatusSectionState();
}

class _TaskStatusSectionState extends State<TaskStatusSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Task Status Overview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TaskStatusChip(
                label: 'On Time',
                count: '24',
                color: Colors.green,
              ),
              TaskStatusChip(
                label: 'Warning',
                count: '7',
                color: Colors.orange,
              ),
              TaskStatusChip(label: 'Delayed', count: '3', color: Colors.red),
              TaskStatusChip(
                label: 'Processing',
                count: '5',
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TaskStatusChip extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const TaskStatusChip({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color.withOpacity(0.1),
      label: Text(
        '$label ($count)',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
