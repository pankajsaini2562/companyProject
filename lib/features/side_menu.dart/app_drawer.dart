import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1E293B),
        child: Column(
          children: [
            // Drawer Header

            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    isSelected: true,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.people_outline,
                    title: 'CRM',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.description_outlined,
                    title: 'Documents & Applications',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.task_alt_outlined,
                    title: 'Tasks',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.business_center_outlined,
                    title: 'HR',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.account_balance_outlined,
                    title: 'Accounts',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.home_work_outlined,
                    title: 'WFH Monitor',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.analytics_outlined,
                    title: 'Reports & Analytics',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.feedback_outlined,
                    title: 'Feedback & Suggestions',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.integration_instructions_outlined,
                    title: 'Integrations',
                  ),

                  // Divider before settings
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Divider(color: Color(0xFF334155), height: 1),
                  ),

                  _buildMenuItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool isSelected = false,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xFF94A3B8),
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {
          if (isLogout) {
            // Show logout confirmation dialog
            _showLogoutDialog(context);
          } else {
            // Navigate to selected screen
            Navigator.pop(context);
            // Add your navigation logic here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Navigating to $title'),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Add your logout logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
