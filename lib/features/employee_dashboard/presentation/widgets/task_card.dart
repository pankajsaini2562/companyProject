import 'package:flutter/material.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/widgets/task_details_screen.dart';

enum TaskStatus { onTime, nearDeadline, delayed, processing }

class TaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String lead;
  final TaskStatus status;
  const TaskCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.lead,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: _statusDot(color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Deadline: $deadline'), Text('Lead: $lead')],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskDetailsScreen(
                title: title,
                deadline: deadline,
                lead: lead,
                status: status,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _statusDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Color _statusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.onTime:
        return Colors.green;
      case TaskStatus.nearDeadline:
        return Colors.orange;
      case TaskStatus.delayed:
        return Colors.red;
      case TaskStatus.processing:
        return Colors.blue;
    }
  }
}
