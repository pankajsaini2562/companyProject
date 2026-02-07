import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accountdashboard/presentation/screens/account_dashboard_screen.dart';
import 'package:mobile_crm/features/crm_module/presentation/screens/leads_list_screen.dart';
import 'package:mobile_crm/features/employ_dashboard/presentation/screens/employ_screen.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/screens/employee_dashboard_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/attendance_screen.dart';
import 'package:mobile_crm/features/hr_dashboard/presentation/screens/hr_dashboard_screen.dart';

import 'package:mobile_crm/features/reports/presentation/screens/report_screen.dart';
import 'package:mobile_crm/features/setting_screen/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/wfh/presentation/screens/wfh_dashboard_screen.dart';

class AdminSideMenu extends StatelessWidget {
  const AdminSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _menuItem(
                  context,
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  onTap: () {},
                ),
                _menuItem(
                  context,
                  icon: Icons.people,
                  title: 'CRM',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeadsListScreen(),
                      ),
                    );
                  },
                ),
                _menuItem(
                  context,
                  icon: Icons.assignment,
                  title: 'Documents & Applications',
                  onTap: () {},
                ),

                _menuItem(
                  context,
                  icon: Icons.person,
                  title: 'Tasks ',
                  onTap: () {},
                ),

                _menuItem(
                  context,
                  icon: Icons.person,
                  title: 'HR',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HrDashboardScreen(),
                      ),
                    );
                  },
                ),
                _menuItem(
                  context,
                  icon: Icons.badge,
                  title: 'Accounts',
                  onTap: () {},
                ),
                _menuItem(
                  context,
                  icon: Icons.work_outline,
                  title: 'WFH Monitor',
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => WfhDashboardScreen(),
                    //   ),
                    // );
                  },
                ),
                _menuItem(
                  context,
                  icon: Icons.analytics,
                  title: 'Reports & Analytics',
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ReportScreen()),
                    // );
                  },
                ),
                _menuItem(
                  context,
                  icon: Icons.analytics,
                  title: 'Feedback & Suggestions',
                  onTap: () {},
                ),

                _menuItem(
                  context,
                  icon: Icons.settings,
                  title: 'Integrations ',
                  onTap: () {},
                ),

                _menuItem(
                  context,
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingScreen()),
                    );
                  },
                ),
                _menuItem(
                  context,
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {},
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // HEADER
  Widget _buildHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Colors.indigo),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.admin_panel_settings,
              size: 32,
              color: Colors.indigo,
            ),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin Panel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'admin@company.com',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MENU ITEM
  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // close drawer
        onTap();
      },
    );
  }
}
