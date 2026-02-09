import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accounts/presentation/screens/account.dart';
import 'package:mobile_crm/features/crm_module/presentation/screens/crm_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/screens/employee_dashboard_screen.dart';
import 'package:mobile_crm/features/feedback/presentation/screens/feedback_suggestion_screen.dart';
import 'package:mobile_crm/features/hr/presentation/screens/hr.dart';
import 'package:mobile_crm/features/integration/presentation/screens/integrations_screen.dart';
import 'package:mobile_crm/features/loans/presentation/screens/loanssection.dart';
import 'package:mobile_crm/features/reports/presentation/screens/report_screen.dart';
import 'package:mobile_crm/features/settings/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/tasks_screen.dart';

// ==================== USER ROLE MODEL ====================
class UserRole {
  final String id;
  final String name;
  final String displayName;
  final Color color;
  final IconData icon;
  final int accessLevel;
  final List<String> allowedRoutes;

  const UserRole({
    required this.id,
    required this.name,
    required this.displayName,
    required this.color,
    required this.icon,
    required this.accessLevel,
    required this.allowedRoutes,
  });

  // Role definitions
  static const UserRole admin = UserRole(
    id: 'admin',
    name: 'Admin',
    displayName: 'Administrator',
    color: Colors.red,
    icon: Icons.admin_panel_settings,
    accessLevel: 100,
    allowedRoutes: [
      'dashboard',
      'crm',
      'employees',
      'loans',
      'tasks',
      'hr',
      'accounts',
      'wfh',
      'reports',
      'feedback',
      'integrations',
    ],
  );

  static const UserRole hrManager = UserRole(
    id: 'hr_manager',
    name: 'HR Manager',
    displayName: 'HR Manager',
    color: Colors.orange,
    icon: Icons.manage_accounts,
    accessLevel: 70,
    allowedRoutes: [
      'dashboard',
      'employees',
      'tasks',
      'hr',
      'wfh',
      'reports',
      'feedback',
    ],
  );

  static const UserRole manager = UserRole(
    id: 'manager',
    name: 'Manager',
    displayName: 'Department Manager',
    color: Colors.blue,
    icon: Icons.groups,
    accessLevel: 60,
    allowedRoutes: [
      'dashboard',
      'crm',
      'loans',
      'tasks',
      'employees',
      'reports',
      'feedback',
      'integrations',
    ],
  );

  static const UserRole employee = UserRole(
    id: 'employee',
    name: 'Employee',
    displayName: 'Staff Member',
    color: Colors.green,
    icon: Icons.person,
    accessLevel: 40,
    allowedRoutes: [
      'dashboard',
      'crm',
      'loans',
      'tasks',
      'hr',
      'reports',
      'feedback',
    ],
  );

  static const UserRole partner = UserRole(
    id: 'partner',
    name: 'Partner',
    displayName: 'Partner/Agent',
    color: Colors.purple,
    icon: Icons.handshake,
    accessLevel: 30,
    allowedRoutes: [
      'dashboard',
      'leads',
      'loans',
      'commission',
      'documents',
      'feedback',
    ],
  );

  // Get role by ID
  static UserRole fromId(String id) {
    switch (id) {
      case 'admin':
        return admin;
      case 'hr_manager':
        return hrManager;
      case 'manager':
        return manager;
      case 'employee':
        return employee;
      case 'partner':
        return partner;
      default:
        return employee;
    }
  }

  // Check if role has access to a route
  bool hasAccess(String route) {
    return allowedRoutes.contains(route);
  }
}

// ==================== MENU ITEM MODEL ====================
class MenuItem {
  final String id;
  final String title;
  final IconData icon;
  final String route;
  final List<String> allowedRoles;

  const MenuItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
    required this.allowedRoles,
  });
}

// ==================== MAIN LAYOUT ====================
class MainLayout extends StatefulWidget {
  final String userRole;
  final String? userName;
  final String? userEmail;

  const MainLayout({
    Key? key,
    required this.userRole,
    this.userName,
    this.userEmail,
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  late UserRole _currentRole;
  late List<MenuItem> _availableMenuItems;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // All possible menu items
  static const List<MenuItem> _allMenuItems = [
    MenuItem(
      id: 'dashboard',
      title: 'Dashboard',
      icon: Icons.dashboard,
      route: 'dashboard',
      allowedRoles: ['admin', 'hr_manager', 'manager', 'employee', 'partner'],
    ),
    MenuItem(
      id: 'crm',
      title: 'CRM / Leads',
      icon: Icons.people,
      route: 'crm',
      allowedRoles: ['admin', 'manager', 'employee'],
    ),
    MenuItem(
      id: 'employees',
      title: 'Employees',
      icon: Icons.group,
      route: 'employees',
      allowedRoles: ['admin', 'hr_manager', 'manager'],
    ),
    MenuItem(
      id: 'loans',
      title: 'Loans',
      icon: Icons.description,
      route: 'loans',
      allowedRoles: ['admin', 'manager', 'employee', 'partner'],
    ),
    MenuItem(
      id: 'tasks',
      title: 'Tasks',
      icon: Icons.task_alt,
      route: 'tasks',
      allowedRoles: ['admin', 'hr_manager', 'manager', 'employee'],
    ),
    MenuItem(
      id: 'hr',
      title: 'HR Management',
      icon: Icons.business_center,
      route: 'hr',
      allowedRoles: ['admin', 'hr_manager', 'employee'],
    ),
    MenuItem(
      id: 'accounts',
      title: 'Accounts',
      icon: Icons.account_balance,
      route: 'accounts',
      allowedRoles: ['admin'],
    ),
    MenuItem(
      id: 'wfh',
      title: 'WFH Monitor',
      icon: Icons.laptop,
      route: 'wfh',
      allowedRoles: ['admin', 'hr_manager'],
    ),
    MenuItem(
      id: 'reports',
      title: 'Reports',
      icon: Icons.bar_chart,
      route: 'reports',
      allowedRoles: ['admin', 'hr_manager', 'manager', 'employee', 'partner'],
    ),
    MenuItem(
      id: 'feedback',
      title: 'Feedback & Suggestions',
      icon: Icons.feedback,
      route: 'feedback',
      allowedRoles: ['admin', 'hr_manager', 'manager', 'employee', 'partner'],
    ),
    MenuItem(
      id: 'integrations',
      title: 'Integrations',
      icon: Icons.extension,
      route: 'integrations',
      allowedRoles: ['admin', 'manager'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentRole = UserRole.fromId(widget.userRole);
    _availableMenuItems = _getAvailableMenuItems();
  }

  // Filter menu items based on role
  List<MenuItem> _getAvailableMenuItems() {
    return _allMenuItems
        .where((item) => item.allowedRoles.contains(widget.userRole))
        .toList();
  }

  // Get screen for route
  Widget _getScreenForRoute(String route) {
    switch (route) {
      case 'dashboard':
        return DashboardScreen(userRole: _currentRole);
      case 'crm':
        return CRMScreen(userRole: _currentRole);
      case 'employees':
        return EmployeeDashboard(userRole: _currentRole);
      case 'loans':
        return LoansSection(userRole: _currentRole);
      case 'tasks':
        return TasksScreen(userRole: _currentRole);
      case 'hr':
        return HRScreen(userRole: _currentRole);
      case 'accounts':
        return AccountsScreen(userRole: _currentRole);
      case 'wfh':
        return WFHMonitorScreen(userRole: _currentRole);
      case 'reports':
        return ReportsAnalyticsScreen(userRole: _currentRole);
      case 'feedback':
        return FeedbackSuggestionsScreen(userRole: _currentRole);
      case 'integrations':
        return IntegrationsScreen(userRole: _currentRole);
      default:
        return _buildAccessDenied();
    }
  }

  void _onMenuSelected(int index) {
    if (index >= 0 && index < _availableMenuItems.length) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.pop(context); // Close drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: _currentRole.color,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          _availableMenuItems[_selectedIndex].title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          // Notifications
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              _showNotifications();
            },
          ),
          // Search
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showSearch();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // User Info Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _currentRole.color,
                    _currentRole.color.withOpacity(0.7),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  (widget.userName ?? 'User')[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _currentRole.color,
                  ),
                ),
              ),
              accountName: Text(
                widget.userName ?? 'User Name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.userEmail ?? 'user@example.com'),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_currentRole.icon, size: 14, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          '${_currentRole.name} • ${_currentRole.accessLevel}%',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _availableMenuItems.length,
                itemBuilder: (context, index) {
                  final item = _availableMenuItems[index];
                  final isSelected = _selectedIndex == index;

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? _currentRole.color.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: isSelected
                            ? _currentRole.color
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: isSelected
                              ? _currentRole.color
                              : Colors.grey.shade800,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: _currentRole.color,
                            )
                          : null,
                      onTap: () => _onMenuSelected(index),
                    ),
                  );
                },
              ),
            ),

            // Bottom Options
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SettingScreen(userRole: _currentRole),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.grey),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
                _showHelpDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                _showLogoutDialog();
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      body: _selectedIndex >= 0 && _selectedIndex < _availableMenuItems.length
          ? _getScreenForRoute(_availableMenuItems[_selectedIndex].route)
          : _buildAccessDenied(),
    );
  }

  // Access Denied Screen
  Widget _buildAccessDenied() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.block, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Text(
            'Access Denied',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'You don\'t have permission to view this page',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  // Show Notifications
  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildNotificationItem(
                'New lead assigned',
                'Lead #12345 assigned to you',
                '5 mins ago',
                Icons.person_add,
                Colors.blue,
              ),
              _buildNotificationItem(
                'Task deadline approaching',
                'Complete document verification',
                '1 hour ago',
                Icons.warning,
                Colors.orange,
              ),
              _buildNotificationItem(
                'Approval required',
                'Loan application needs your approval',
                '2 hours ago',
                Icons.approval,
                Colors.green,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  // Show Search
  void _showSearch() {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }

  // Show Help Dialog
  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.help_outline, color: Color(0xFF2C3E7C)),
            SizedBox(width: 12),
            Text('Help & Support'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Need help? Contact us:'),
            const SizedBox(height: 16),
            _buildContactOption(Icons.phone, 'Call', '+91 98765 43210'),
            _buildContactOption(Icons.email, 'Email', 'support@company.com'),
            _buildContactOption(
              Icons.chat,
              'Live Chat',
              'Available 9 AM - 6 PM',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: _currentRole.color, size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Show Logout Dialog
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close drawer
              // Navigate to login screen
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ==================== CUSTOM SEARCH DELEGATE ====================
class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchTerms = [
    'Leads',
    'Loans',
    'Tasks',
    'Employees',
    'Reports',
    'Dashboard',
    'Accounts',
    'Settings',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(result),
          onTap: () {
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(result),
          onTap: () {
            query = result;
            showResults(context);
          },
        );
      },
    );
  }
}
