import 'package:flutter/material.dart';
import 'package:mobile_crm/features/crm_module/presentation/widgets/add_customer_loan_screen.dart';
import 'package:mobile_crm/features/crm_module/presentation/widgets/add_edit_lead_screen.dart';
import 'package:mobile_crm/features/crm_module/presentation/widgets/customer_loan_card.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/lead_detail_screen.dart';

class LeadsListScreen extends StatelessWidget {
  const LeadsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRM - Customers & Loans'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddCustomerLoanScreen()),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          CustomerLoanCard(
            name: 'Rahul Sharma',
            loanAmount: '₹25,00,000',
            status: LoanStatus.newLead,
          ),
          CustomerLoanCard(
            name: 'Neha Singh',
            loanAmount: '₹10,00,000',
            status: LoanStatus.processing,
          ),
          CustomerLoanCard(
            name: 'Amit Verma',
            loanAmount: '₹18,00,000',
            status: LoanStatus.approved,
          ),
          CustomerLoanCard(
            name: 'Suresh Patel',
            loanAmount: '₹8,00,000',
            status: LoanStatus.rejected,
          ),
        ],
      ),
    );
  }
}

class LeadCard extends StatelessWidget {
  final String name;
  final String status;
  final String assignedTo;

  const LeadCard({
    super.key,
    required this.name,
    required this.status,
    required this.assignedTo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Assigned: $assignedTo'),
        trailing: Chip(
          label: Text(status),
          backgroundColor: _statusColor(status).withOpacity(0.1),
          labelStyle: TextStyle(color: _statusColor(status)),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const LeadDetailsScreen(lead: {}),
            ),
          );
        },
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.blue;
      case 'Processing':
        return Colors.orange;
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
