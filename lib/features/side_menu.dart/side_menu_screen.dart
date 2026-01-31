import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accounts/presentation/screens/account.dart';
import 'package:mobile_crm/features/chat/presentation/screens/chat_screen.dart';
import 'package:mobile_crm/features/clients/presentation/screens/client.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mobile_crm/features/hr/presentation/screens/hr.dart';
import 'package:mobile_crm/features/leads/presentation/screens/new_lead_screen.dart';
import 'package:mobile_crm/features/settings/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/new_task_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        color: const Color(0xFF2E1A47), // dark purple
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Meerut\nSkills_",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Menu items
            menuItem(
              "Dashboard",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),
            menuItem(
              "Leads & Pipelines",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewLeadScreen()),
                );
              },
            ),
            menuItem(
              "Tasks",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTaskScreen()),
                );
              },
            ),
            menuItem(
              "Clients",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Client()),
                );
              },
            ),
            menuItem(
              "Accounting reports",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
              },
            ),
            menuItem(
              "HR Analysis",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HR()),
                );
              },
            ),
            menuItem(
              "Chat Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),

            const Spacer(),

            const Divider(color: Colors.white24),

            menuItem(
              "Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String title, {VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          onTap: onTap,
        ),
        const Divider(color: Colors.white24, height: 1),
      ],
    );
  }
}
