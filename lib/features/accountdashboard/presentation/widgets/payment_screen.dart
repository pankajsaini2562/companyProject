import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PaymentTile(
            title: 'Client Payment',
            amount: '₹30,000',
            method: 'UPI',
          ),
          PaymentTile(
            title: 'Bank Transfer',
            amount: '₹1,20,000',
            method: 'NEFT',
          ),
        ],
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  final String title;
  final String amount;
  final String method;

  const PaymentTile({
    super.key,
    required this.title,
    required this.amount,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.payment),
        title: Text(title),
        subtitle: Text(method),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
