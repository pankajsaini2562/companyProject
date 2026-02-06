import 'package:flutter/material.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/kpi_section.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/quick_action_section.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/recent_activity_section.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/task_status_section.dart';
import 'package:mobile_crm/features/side_menu.dart/admin_side_menu.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminSideMenu(),
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            KpiSection(),
            SizedBox(height: 20),
            TaskStatusSection(),
            SizedBox(height: 20),
            QuickActionSection(),
            SizedBox(height: 20),
            RecentActivitySection(),
          ],
        ),
      ),
    );
  }
}
