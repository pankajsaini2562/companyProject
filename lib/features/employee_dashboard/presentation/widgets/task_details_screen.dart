import 'package:flutter/material.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/widgets/task_card.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String title;
  final String deadline;
  final String lead;
  final TaskStatus status;
  const TaskDetailsScreen({
    super.key,
    required this.title,
    required this.deadline,
    required this.lead,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailRow('Title', title),
            _detailRow('Deadline', deadline),
            _detailRow('Lead / Client', lead),
            _detailRow('Status', status.name),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Mark as Completed'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
