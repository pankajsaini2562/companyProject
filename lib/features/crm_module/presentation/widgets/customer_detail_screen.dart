import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Name'), subtitle: Text('Rahul Sharma')),
          ListTile(title: Text('Loan Amount'), subtitle: Text('₹25,00,000')),
          ListTile(title: Text('CIBIL Score'), subtitle: Text('760')),

          Divider(),

          ListTile(leading: Icon(Icons.file_present), title: Text('PAN Card')),
          ListTile(
            leading: Icon(Icons.file_present),
            title: Text('Aadhaar Card'),
          ),
          ListTile(leading: Icon(Icons.file_present), title: Text('ITR')),
          ListTile(leading: Icon(Icons.file_present), title: Text('GST')),
        ],
      ),
    );
  }
}
