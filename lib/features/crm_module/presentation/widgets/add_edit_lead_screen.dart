import 'package:flutter/material.dart';

class AddEditLeadScreen extends StatelessWidget {
  const AddEditLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Lead')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Customer Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          _input('Customer Name'),
          _input('Mobile'),
          _input('Email'),

          const SizedBox(height: 16),
          const Text(
            'Loan Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          _input('Loan Amount'),
          _input('Loan Type'),
          _input('CIBIL Score'),

          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Save Lead')),
        ],
      ),
    );
  }
}

Widget _input(String hint) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
