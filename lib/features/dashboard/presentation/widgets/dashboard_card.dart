import 'package:flutter/material.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/report_screen.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dashboard",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _dashboardCard(
            color: const Color(0xFF6BC46D),
            title: "Conversion %",
            value: "18.7%",
            subtitle: "2.1 more than last month",
          ),

          const SizedBox(height: 10),

          _dashboardCard(
            color: const Color(0xFFF28B6A),
            title: "Task Delay",
            value: "4.5%",
            subtitle: "1.7% less than last month",
          ),

          const SizedBox(height: 10),

          _dashboardCard(
            color: const Color(0xFF4DB6E2),
            title: "Avg. Processing Time",
            value: "7 days",
            subtitle: "3 days vs last month",
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportScreen()),
                );
              },
              child: const Text("Generate report"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardCard({
    required Color color,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
          const Icon(Icons.access_time, color: Colors.white),
        ],
      ),
    );
  }
}
