import 'package:flutter/material.dart';
import 'package:mobile_crm/features/crm_module/presentation/widgets/customer_detail_screen.dart';

enum LoanStatus { newLead, processing, approved, rejected }

class CustomerLoanCard extends StatelessWidget {
  final String name;
  final String loanAmount;
  final LoanStatus status;
  const CustomerLoanCard({
    super.key,
    required this.name,
    required this.loanAmount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status);
    return Card(
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Loan: $loanAmount'),
        trailing: Chip(
          label: Text(_statusText(status)),
          backgroundColor: color.withOpacity(0.1),
          labelStyle: TextStyle(color: color),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CustomerDetailScreen()),
          );
        },
      ),
    );
  }

  Color _statusColor(LoanStatus status) {
    switch (status) {
      case LoanStatus.newLead:
        return Colors.blue;
      case LoanStatus.processing:
        return Colors.orange;
      case LoanStatus.approved:
        return Colors.green;
      case LoanStatus.rejected:
        return Colors.red;
    }
  }

  String _statusText(LoanStatus status) {
    switch (status) {
      case LoanStatus.newLead:
        return 'New';
      case LoanStatus.processing:
        return 'Processing';
      case LoanStatus.approved:
        return 'Approved';
      case LoanStatus.rejected:
        return 'Rejected';
    }
  }
}
