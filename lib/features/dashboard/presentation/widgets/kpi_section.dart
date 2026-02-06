import 'package:flutter/material.dart';

class KpiSection extends StatefulWidget {
  const KpiSection({super.key});

  @override
  State<KpiSection> createState() => _KpiSectionState();
}

class _KpiSectionState extends State<KpiSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.4,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: const [
        KpiCard(
          title: 'Total Leads',
          value: '1,248',
          icon: Icons.people,
          color: Colors.blue,
        ),
        KpiCard(
          title: 'Active Loans',
          value: '312',
          icon: Icons.assignment,
          color: Colors.green,
        ),
        KpiCard(
          title: 'Monthly Revenue',
          value: '₹12.4L',
          icon: Icons.currency_rupee,
          color: Colors.purple,
        ),
        KpiCard(
          title: 'Employees',
          value: '46',
          icon: Icons.badge,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const KpiCard({
    super.key,
    required this.title,
    required this.value,
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
            Icon(icon, color: color, size: 28),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
