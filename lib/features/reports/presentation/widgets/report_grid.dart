import 'package:flutter/material.dart';

class ReportGrid extends StatelessWidget {
  const ReportGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        ReportCard(
          title: 'Sales Report',
          subtitle: 'Leads, Conversion, Revenue',
          icon: Icons.trending_up,
          color: Colors.green,
        ),
        ReportCard(
          title: 'HR Report',
          subtitle: 'Attendance, Salary, KPI',
          icon: Icons.people,
          color: Colors.blue,
        ),
        ReportCard(
          title: 'Loan Report',
          subtitle: 'Approved, Pending, Closed',
          icon: Icons.assignment,
          color: Colors.purple,
        ),
        ReportCard(
          title: 'Accounts Report',
          subtitle: 'GST, Commission, P&L',
          icon: Icons.currency_rupee,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const ReportCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
            const Spacer(),
            Row(
              children: [
                _downloadButton(
                  icon: Icons.picture_as_pdf,
                  label: 'PDF',
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                _downloadButton(
                  icon: Icons.table_chart,
                  label: 'Excel',
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _downloadButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18, color: color),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color.withOpacity(0.5)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
