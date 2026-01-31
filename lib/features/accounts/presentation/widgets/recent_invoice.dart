import 'package:flutter/material.dart';

class RecentInvoicesUI extends StatelessWidget {
  const RecentInvoicesUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Invoices',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _invoiceTile(
            name: 'Rakesh Kumar',
            service: 'Loan Processing',
            date: '15 Apr 2025',
          ),
          _invoiceTile(
            name: 'Priya Sharma',
            service: 'Consulting',
            date: '18 Apr 2025',
          ),
          _invoiceTile(
            name: 'Amit Patel',
            service: 'Loan Processing',
            date: '15 May 2025',
          ),
          _invoiceTile(
            name: 'Neha Singh',
            service: 'Documentation',
            date: '17 May 2025',
          ),
          _invoiceTile(
            name: 'Nikhil Srivastav',
            service: 'Consulting',
            date: '27 May 2025',
          ),
        ],
      ),
    );
  }

  Widget _invoiceTile({
    required String name,
    required String service,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      service,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.description, size: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
