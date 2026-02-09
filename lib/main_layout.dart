import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accounts/presentation/screens/account.dart';
import 'package:mobile_crm/features/crm_module/presentation/screens/crm_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mobile_crm/features/feedback/presentation/screens/feedback_suggestion_screen.dart';
import 'package:mobile_crm/features/hr/presentation/screens/hr.dart';
import 'package:mobile_crm/features/integration/presentation/screens/integrations_screen.dart';
import 'package:mobile_crm/features/reports/presentation/screens/report_screen.dart';
import 'package:mobile_crm/features/settings/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/tasks_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    CRMScreen(),
    TasksScreen(),
    HRScreen(),
    AccountsScreen(),
    WFHMonitorScreen(),
    ReportsAnalyticsScreen(),
    FeedbackSuggestionsScreen(),
    IntegrationsScreen(),
  ];

  void _onMenuSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: _onMenuSelected,
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
    );
  }
}
