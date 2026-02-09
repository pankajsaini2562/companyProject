import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AppDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1E293B),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 40),

            _buildMenuItem(Icons.dashboard_outlined, "Dashboard", 0),
            _buildMenuItem(Icons.people_outline, "CRM", 1),
            _buildMenuItem(Icons.people_outline, "Employees", 2),
            _buildMenuItem(Icons.request_quote_outlined, "Loans", 3),

            _buildMenuItem(Icons.task_alt_outlined, "Tasks", 4),
            _buildMenuItem(Icons.business_center_outlined, "HR", 5),
            _buildMenuItem(Icons.account_balance_outlined, "Accounts", 6),
            _buildMenuItem(Icons.home_work_outlined, "WFH Monitor", 7),
            _buildMenuItem(Icons.analytics_outlined, "Reports", 8),

            _buildMenuItem(
              Icons.feedback_outlined,
              "Feedback & Suggestions",
              9,
            ),
            _buildMenuItem(
              Icons.integration_instructions_outlined,
              "Integrations",
              10,
            ),

            _buildMenuItem(Icons.settings_outlined, "Settings", 11),

            const Divider(color: Color(0xFF334155)),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xFF94A3B8),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () => onItemSelected(index),
      ),
    );
  }
}
