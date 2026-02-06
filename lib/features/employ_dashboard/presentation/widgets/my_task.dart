import 'package:flutter/material.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/task_card.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TaskCard(
          title: 'Follow-up Client',
          deadline: 'Today 5:00 PM',
          lead: 'Rahul Sharma',
          status: TaskStatus.onTime,
        ),
        TaskCard(
          title: 'Document Verification',
          deadline: 'Tomorrow',
          lead: 'Amit Verma',
          status: TaskStatus.nearDeadline,
        ),
        TaskCard(
          title: 'Upload Bank Statement',
          deadline: 'Yesterday',
          lead: 'Neha Singh',
          status: TaskStatus.delayed,
        ),
        TaskCard(
          title: 'Recheck Application',
          deadline: 'Processing',
          lead: 'Suresh Patel',
          status: TaskStatus.processing,
        ),
      ],
    );
  }
}
