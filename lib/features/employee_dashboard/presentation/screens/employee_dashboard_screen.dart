import 'package:flutter/material.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/widgets/create_task_screen.dart';
import '../widgets/task_card.dart';

class EmployeeDashboardScreen extends StatelessWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
            deadline: 'In Progress',
            lead: 'Suresh Patel',
            status: TaskStatus.processing,
          ),
        ],
      ),
    );
  }
}
