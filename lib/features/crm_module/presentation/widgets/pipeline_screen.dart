import 'package:flutter/material.dart';

class PipelineScreen extends StatelessWidget {
  const PipelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pipeline')),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            _PipelineColumn(title: 'New'),
            _PipelineColumn(title: 'Verified'),
            _PipelineColumn(title: 'Processing'),
            _PipelineColumn(title: 'Approved'),
            _PipelineColumn(title: 'Rejected'),
            _PipelineColumn(title: 'Closed'),
          ],
        ),
      ),
    );
  }
}

class _PipelineColumn extends StatelessWidget {
  final String title;

  const _PipelineColumn({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const ListTile(title: Text('Rahul Sharma')),
          const ListTile(title: Text('Neha Singh')),
        ],
      ),
    );
  }
}
