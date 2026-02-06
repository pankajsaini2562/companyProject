import 'package:flutter/material.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/attendance_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/employee_directory_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/leave_management_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/performance_tracker_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/training_sop_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/widgets/hr_menu_card.dart';

class HrDashboardScreen extends StatelessWidget {
  const HrDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('HR Management'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: [
            HrMenuCard(
              title: 'Employees',
              icon: Icons.people,
              onTap: () => _navigate(context, const EmployeeDirectoryScreen()),
            ),
            HrMenuCard(
              title: 'Attendance',
              icon: Icons.calendar_today,
              onTap: () => _navigate(context, const AttendanceScreen()),
            ),
            HrMenuCard(
              title: 'Leave Management',
              icon: Icons.event_busy,
              onTap: () => _navigate(context, const LeaveManagementScreen()),
            ),
            HrMenuCard(
              title: 'Performance',
              icon: Icons.trending_up,
              onTap: () => _navigate(context, const PerformanceTrackerScreen()),
            ),
            HrMenuCard(
              title: 'Training & SOP',
              icon: Icons.school,
              onTap: () => _navigate(context, const TrainingSopScreen()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}
