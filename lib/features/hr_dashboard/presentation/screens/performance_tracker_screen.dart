import 'package:flutter/material.dart';

class PerformanceTrackerScreen extends StatelessWidget {
  const PerformanceTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Performance Tracker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            PerformanceKpiRow(),
            SizedBox(height: 20),
            PerformanceChartCard(),
          ],
        ),
      ),
    );
  }
}

class PerformanceKpiRow extends StatelessWidget {
  const PerformanceKpiRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: PerfKpiCard(title: 'Sales', value: '82%', color: Colors.green),
        ),
        SizedBox(width: 12),
        Expanded(
          child: PerfKpiCard(title: 'HR', value: '74%', color: Colors.blue),
        ),
      ],
    );
  }
}

class PerfKpiCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const PerfKpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceChartCard extends StatelessWidget {
  const PerformanceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200, child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
