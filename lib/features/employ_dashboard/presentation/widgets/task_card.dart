import 'package:flutter/material.dart';

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
    final Color color = _getStatusColor(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _statusDot(color),
            ],
          ),

          const SizedBox(height: 10),

          /// Deadline
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                deadline,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 4),

          /// Lead / Client
          Row(
            children: [
              const Icon(Icons.person, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                lead,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Color _getStatusColor(TaskStatus status) {
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
