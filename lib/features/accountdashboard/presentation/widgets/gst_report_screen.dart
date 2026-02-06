import 'package:flutter/material.dart';

class GstReportScreen extends StatelessWidget {
  const GstReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GST Reports')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.description),
              title: Text('GSTR-1'),
              subtitle: Text('Sales Report'),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('GSTR-3B'),
              subtitle: Text('Monthly Summary'),
            ),
          ],
        ),
      ),
    );
  }
}
