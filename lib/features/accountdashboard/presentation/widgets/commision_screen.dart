import 'package:flutter/material.dart';

class CommisionScreen extends StatelessWidget {
  const CommisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Commission')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CommissionTile(name: 'Amit', amount: '₹12,000'),
          CommissionTile(name: 'Rohit', amount: '₹18,500'),
        ],
      ),
    );
  }
}

class CommissionTile extends StatelessWidget {
  final String name;
  final String amount;

  const CommissionTile({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade100,
          child: Text(
            name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: const Text('Commission Earned'),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
