import 'package:flutter/material.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/attendance_card.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/employ_bottomnav.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/greeting_bar.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/my_task.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/performance_snapshot.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/quick_action.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/widgets/section_tile.dart';

class EmployScreen extends StatelessWidget {
  const EmployScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      /// 🔻 BOTTOM NAV
      bottomNavigationBar: const EmployBottomnav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GreetingBar(),
              SizedBox(height: 16),

              AttendanceCard(),
              SizedBox(height: 20),

              SectionTile('My Tasks'),
              MyTask(),

              SizedBox(height: 20),
              PerformanceSnapshot(),

              SizedBox(height: 20),
              SectionTile('Quick Actions'),
              QuickAction(),
            ],
          ),
        ),
      ),
    );
  }
}
