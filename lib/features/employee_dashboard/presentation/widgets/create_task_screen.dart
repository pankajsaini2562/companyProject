import 'package:flutter/material.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Lead / Client'),
            ),
            TextField(decoration: const InputDecoration(labelText: 'Deadline')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Create Task')),
          ],
        ),
      ),
    );
  }
}
