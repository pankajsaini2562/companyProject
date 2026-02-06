import 'package:flutter/material.dart';

class DailyReportScreen extends StatelessWidget {
  const DailyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report'),
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ReportTile(title: 'Lead Follow-ups', subtitle: 'Completed 5 calls'),
            ReportTile(
              title: 'Document Verification',
              subtitle: 'Checked 3 files',
            ),
            ReportTile(
              title: 'Status Update',
              subtitle: 'Updated CRM pipeline',
            ),
          ],
        ),
      ),
    );
  }
}

class ReportTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const ReportTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
