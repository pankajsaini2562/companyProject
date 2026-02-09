import 'package:flutter/material.dart';
import 'package:mobile_crm/features/auth/presentation/screens/login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});
  static final List<UserRole> roles = [
    UserRole(
      id: 'admin',
      name: 'Admin',
      description: 'Full system access and control',
      color: Colors.red,
      icon: Icons.admin_panel_settings,
      accessLevel: 100,
      features: [
        'Complete Dashboard Access',
        'User Management',
        'All Department Reports',
        'System Configuration',
        'Audit Logs',
        'API Integrations',
      ],
    ),
    UserRole(
      id: 'hr_manager',
      name: 'HR Manager',
      description: 'HR and employee management',
      color: Colors.orange,
      icon: Icons.manage_accounts,
      accessLevel: 70,
      features: [
        'Employee Management',
        'Attendance Tracking',
        'Performance KPI',
        'Training & SOP Tests',
        'Payroll Processing',
        'WFH Monitoring',
      ],
    ),
    UserRole(
      id: 'manager',
      name: 'Manager',
      description: 'Department and team management',
      color: Colors.blue,
      icon: Icons.groups,
      accessLevel: 60,
      features: [
        'CRM & Lead Management',
        'Loan Processing',
        'Task Assignment',
        'Team Performance',
        'Department Reports',
        'Customer Communication',
      ],
    ),
    UserRole(
      id: 'employee',
      name: 'Employee',
      description: 'Task execution and updates',
      color: Colors.green,
      icon: Icons.person,
      accessLevel: 40,
      features: [
        'Assigned Tasks',
        'Lead Updates',
        'Mark Attendance',
        'Training Resources',
        'Personal Reports',
        'Document Upload',
      ],
    ),
    UserRole(
      id: 'partner',
      name: 'Partner/Agent',
      description: 'Lead submission and commission tracking',
      color: Colors.purple,
      icon: Icons.handshake,
      accessLevel: 30,
      features: [
        'Submit New Leads',
        'Track Applications',
        'Commission Reports',
        'Upload Documents',
        'Payment Status',
        'Performance Stats',
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2C3E7C), Color(0xFF4A5F9D)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Select Your Role',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Choose how you want to access the system',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Role Cards
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    return _buildRoleCard(context, roles[index]);
                  },
                ),
              ),

              // Logout Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.white70),
                  label: const Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, UserRole role) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => MainScreen(userRole: role)),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: role.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(role.icon, color: role.color, size: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            role.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E7C),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            role.description,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: role.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${role.accessLevel}%',
                        style: TextStyle(
                          color: role.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: role.features.map((feature) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: role.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: role.color.withOpacity(0.3)),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 11,
                          color: role.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.arrow_forward, color: role.color, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
