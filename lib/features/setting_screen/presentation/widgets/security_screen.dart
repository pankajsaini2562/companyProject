import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Change Password'),
          ),
          ListTile(
            leading: Icon(Icons.fingerprint),
            title: Text('Enable Biometric'),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Login Devices'),
          ),
        ],
      ),
    );
  }
}
