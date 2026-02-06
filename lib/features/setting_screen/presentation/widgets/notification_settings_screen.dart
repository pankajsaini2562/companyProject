import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: const [
          _NotificationTile(title: 'Task Updates'),
          _NotificationTile(title: 'Attendance Alerts'),
          _NotificationTile(title: 'HR Announcements'),
          _NotificationTile(title: 'Payment Notifications'),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  const _NotificationTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(title: Text(title), value: true, onChanged: (v) {});
  }
}
