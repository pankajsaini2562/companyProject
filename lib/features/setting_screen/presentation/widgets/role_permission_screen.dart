import 'package:flutter/material.dart';

class RolePermissionScreen extends StatelessWidget {
  const RolePermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Role & Permissions')),
      body: ListView(
        children: const [
          _PermissionTile(title: 'View Leads', allowed: true),
          _PermissionTile(title: 'Edit Leads', allowed: false),
          _PermissionTile(title: 'Approve Loans', allowed: false),
          _PermissionTile(title: 'View Reports', allowed: true),
        ],
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final String title;
  final bool allowed;

  const _PermissionTile({required this.title, required this.allowed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(
        allowed ? Icons.check_circle : Icons.cancel,
        color: allowed ? Colors.green : Colors.red,
      ),
    );
  }
}
