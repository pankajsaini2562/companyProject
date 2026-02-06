import 'package:flutter/material.dart';

import 'package:mobile_crm/features/setting_screen/presentation/widgets/notification_settings_screen.dart';
import 'package:mobile_crm/features/setting_screen/presentation/widgets/profile_screen.dart';
import 'package:mobile_crm/features/setting_screen/presentation/widgets/role_permission_screen.dart';
import 'package:mobile_crm/features/setting_screen/presentation/widgets/security_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          _settingTile(
            context,
            icon: Icons.person,
            title: 'Profile',
            screen: const ProfileScreen(),
          ),
          _settingTile(
            context,
            icon: Icons.lock,
            title: 'Security',
            screen: const SecurityScreen(),
          ),
          _settingTile(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            screen: const NotificationSettingsScreen(),
          ),
          _settingTile(
            context,
            icon: Icons.admin_panel_settings,
            title: 'Role & Permissions',
            screen: const RolePermissionScreen(),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _settingTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget screen,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}
