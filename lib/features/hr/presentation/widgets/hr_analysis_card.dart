import 'package:flutter/material.dart';
import '../widgets/kpi_tile.dart';

class HrAnalysisCard extends StatelessWidget {
  const HrAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HR Analysis',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: const [
                KpiTile(
                  value: '25',
                  label: 'Employees',
                  icon: Icons.verified_user_outlined,
                  color: Colors.green,
                ),
                KpiTile(
                  value: '85%',
                  label: 'Avg Attendance',
                  icon: Icons.verified_user_outlined,
                  color: Colors.green,
                ),
                KpiTile(
                  value: '89%',
                  label: 'Avg Performance',
                  icon: Icons.trending_up,
                  color: Colors.purple,
                ),
                KpiTile(
                  value: '8',
                  label: 'Training Complete',
                  icon: Icons.school_outlined,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
