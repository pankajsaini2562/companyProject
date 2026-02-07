import 'package:flutter/material.dart';

class AddCustomerLoanScreen extends StatelessWidget {
  const AddCustomerLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Customer & Loan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Customer Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          _input('Customer Name'),
          _input('Mobile Number'),
          _input('Email'),
          _input('PAN Number'),
          _input('Aadhaar Number'),

          const SizedBox(height: 16),
          const Text(
            'Loan Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          _input('Loan Amount'),
          _input('Loan Type'),
          _input('CIBIL Score'),

          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Save Customer')),
        ],
      ),
    );
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
}
