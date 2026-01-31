import 'package:flutter/material.dart';

class AccountingReports extends StatelessWidget {
  const AccountingReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        const Text(
          'Accounting Reports',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        /// Cards Grid
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _ReportTile(
              title: 'Total revenue',
              value: '₹45.2L',
              icon: Icons.attach_money,
              percentage: '+18.7%',
              percentageColor: Colors.green,
            ),
            _ReportTile(
              title: 'Commission Paid',
              value: '₹8.5L',
              icon: Icons.payments_outlined,
              percentage: '+12.3%',
              percentageColor: Colors.green,
            ),
            _ReportTile(
              title: 'Outstanding',
              value: '₹12.3L',
              icon: Icons.trending_down,
              percentage: '-8.2%',
              percentageColor: Colors.red,
            ),
            _ReportTile(
              title: 'GST Collected',
              value: '₹6.8L',
              icon: Icons.receipt_long,
              percentage: '-15.9%',
              percentageColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}

/// Individual report tile
class _ReportTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String percentage;
  final Color percentageColor;

  const _ReportTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.percentage,
    required this.percentageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon + percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: percentageColor, size: 22),
              Text(
                percentage,
                style: TextStyle(
                  color: percentageColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// Value
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          /// Title
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
