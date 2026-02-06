import 'package:flutter/material.dart';

class InvoiceListScreen extends StatelessWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invoices')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          InvoiceTile(invoiceNo: 'INV-1012', amount: '₹45,000', status: 'Paid'),
          InvoiceTile(
            invoiceNo: 'INV-1013',
            amount: '₹62,000',
            status: 'Pending',
          ),
        ],
      ),
    );
  }
}

class InvoiceTile extends StatelessWidget {
  final String invoiceNo;
  final String amount;
  final String status;

  const InvoiceTile({
    super.key,
    required this.invoiceNo,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isPaid = status == 'Paid';

    return Card(
      child: ListTile(
        leading: const Icon(Icons.receipt_long),
        title: Text(invoiceNo),
        subtitle: Text(amount),
        trailing: Chip(
          label: Text(status),
          backgroundColor: isPaid ? Colors.green.shade100 : Colors.red.shade100,
        ),
      ),
    );
  }
}
