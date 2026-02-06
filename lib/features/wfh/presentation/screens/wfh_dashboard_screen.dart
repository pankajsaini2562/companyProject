import 'package:flutter/material.dart';
import 'package:mobile_crm/features/wfh/presentation/widgets/statcard.dart';

class WfhDashboardScreen extends StatelessWidget {
  const WfhDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('Work From Home'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _attendanceCard(),
            const SizedBox(height: 16),
            _timeStats(),
            const SizedBox(height: 16),
            _productivityCard(),
            const SizedBox(height: 16),
            _dailyReportCard(),
          ],
        ),
      ),
    );
  }

  // 🔹 Attendance Card
  Widget _attendanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.login, color: Colors.green),
        title: const Text('Login Time'),
        subtitle: const Text('09:32 AM'),
        trailing: ElevatedButton(onPressed: () {}, child: const Text('Logout')),
      ),
    );
  }

  // 🔹 Active / Idle Time
  Widget _timeStats() {
    return Row(
      children: const [
        Expanded(
          child: StatCard(
            title: 'Active Time',
            value: '5h 40m',
            color: Colors.green,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: 'Idle Time',
            value: '1h 20m',
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  // 🔹 Productivity
  Widget _productivityCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: const [
            Icon(Icons.speed, size: 40, color: Colors.blue),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Productivity Score',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('78%', style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Daily Report
  Widget _dailyReportCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.description, color: Colors.indigo),
        title: const Text('Daily Work Report'),
        subtitle: const Text('2 tasks completed'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
