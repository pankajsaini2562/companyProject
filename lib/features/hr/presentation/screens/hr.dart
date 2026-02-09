import 'package:flutter/material.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

// Main HR Screen
class HRScreen extends StatefulWidget {
  const HRScreen({Key? key}) : super(key: key);

  @override
  State<HRScreen> createState() => _HRScreenState();
}

class _HRScreenState extends State<HRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF1E293B)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('HR Management'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Stats Cards
            _buildQuickStatsSection(),
            const SizedBox(height: 24),

            // Main Feature Grid
            _buildFeatureGrid(context),
            const SizedBox(height: 24),

            // Recent Activity
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total Staff',
                '45',
                Icons.people,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Present Today',
                '42',
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'WFH Today',
                '8',
                Icons.home_work,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Pending Tasks',
                '12',
                Icons.assignment,
                Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HR Features',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
          children: [
            _buildFeatureCard(
              context,
              'Performance Tracker',
              Icons.analytics,
              Colors.purple,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PerformanceTrackerScreen(),
                ),
              ),
            ),
            _buildFeatureCard(
              context,
              'Attendance & Location',
              Icons.location_on,
              Colors.blue,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AttendanceLocationScreen(),
                ),
              ),
            ),
            _buildFeatureCard(
              context,
              'Salary Calculator',
              Icons.calculate,
              Colors.green,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SalaryCalculatorScreen(),
                ),
              ),
            ),
            _buildFeatureCard(
              context,
              'Training Resources',
              Icons.school,
              Colors.orange,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TrainingResourcesScreen(),
                ),
              ),
            ),
            _buildFeatureCard(
              context,
              'Document Locker',
              Icons.lock,
              Colors.red,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DocumentLockerScreen()),
              ),
            ),
            _buildFeatureCard(
              context,
              'Training & Tests',
              Icons.quiz,
              Colors.teal,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TrainingTestScreen()),
              ),
            ),
            _buildFeatureCard(
              context,
              'WFH Monitor',
              Icons.home,
              Colors.indigo,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WFHMonitorScreen()),
              ),
            ),
            _buildFeatureCard(
              context,
              'Certificates',
              Icons.card_membership,
              Colors.amber,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CertificatesScreen()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildActivityItem(
          'John Doe completed SOP Training Test',
          '2 hours ago',
          Icons.check_circle,
          Colors.green,
        ),
        _buildActivityItem(
          'Sarah Smith uploaded document to locker',
          '4 hours ago',
          Icons.upload_file,
          Colors.blue,
        ),
        _buildActivityItem(
          'Mike Johnson marked attendance',
          '1 day ago',
          Icons.location_on,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    String title,
    String time,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Performance Tracker Screen
class PerformanceTrackerScreen extends StatefulWidget {
  const PerformanceTrackerScreen({Key? key}) : super(key: key);

  @override
  State<PerformanceTrackerScreen> createState() =>
      _PerformanceTrackerScreenState();
}

class _PerformanceTrackerScreenState extends State<PerformanceTrackerScreen> {
  String selectedDepartment = 'Sales';
  final List<String> departments = [
    'Sales',
    'Operations',
    'Marketing',
    'Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Tracker'),
        backgroundColor: Colors.purple.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Department Filter
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedDepartment,
                isExpanded: true,
                underline: const SizedBox(),
                items: departments.map((dept) {
                  return DropdownMenuItem(value: dept, child: Text(dept));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            // KPI Cards
            _buildKPISection(),
            const SizedBox(height: 24),

            // Employee Performance List
            _buildEmployeePerformanceList(),
          ],
        ),
      ),
    );
  }

  Widget _buildKPISection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Department KPIs',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildKPICard('Average Performance', '85%', Colors.green),
        _buildKPICard('Tasks Completed', '142/160', Colors.blue),
        _buildKPICard('On-Time Delivery', '92%', Colors.orange),
        _buildKPICard('Customer Satisfaction', '4.5/5', Colors.purple),
      ],
    );
  }

  Widget _buildKPICard(String label, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeePerformanceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Team Performance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildEmployeeCard('John Doe', 'Sales Executive', 92, Colors.green),
        _buildEmployeeCard('Sarah Smith', 'Sales Manager', 88, Colors.green),
        _buildEmployeeCard(
          'Mike Johnson',
          'Sales Associate',
          75,
          Colors.orange,
        ),
        _buildEmployeeCard('Emily Davis', 'Sales Executive', 65, Colors.red),
      ],
    );
  }

  Widget _buildEmployeeCard(
    String name,
    String role,
    int performance,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Text(
                  name[0],
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$performance%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: performance / 100,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}

// Attendance & Location Screen
class AttendanceLocationScreen extends StatelessWidget {
  const AttendanceLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance & Location'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Attendance Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade500],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Today\'s Attendance',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '09:15 AM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Check-in Time',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTimeInfo('Work Hours', '7h 45m', Icons.access_time),
                      _buildTimeInfo('Break Time', '45m', Icons.coffee),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Mark Attendance Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Mark attendance logic
                },
                icon: const Icon(Icons.location_on),
                label: const Text('Mark Attendance (Current Location)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Location Tracking
            const Text(
              'Today\'s Location Trail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildLocationCard('Office - Main Building', '09:15 AM', true),
            _buildLocationCard('Client Meeting - ABC Corp', '11:30 AM', false),
            _buildLocationCard('Lunch Break - Nearby Cafe', '01:00 PM', false),
            _buildLocationCard('Office - Main Building', '02:15 PM', false),

            const SizedBox(height: 24),

            // Monthly Attendance Summary
            const Text(
              'This Month',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard('Present', '18', Colors.green),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Absent', '1', Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('WFH', '3', Colors.orange)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInfo(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildLocationCard(String location, String time, bool isCurrent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCurrent ? Colors.blue : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: isCurrent ? Colors.blue : Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          if (isCurrent)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Current',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Salary Calculator Screen
class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<SalaryCalculatorScreen> createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController basicSalaryController = TextEditingController();
  final TextEditingController allowancesController = TextEditingController();
  final TextEditingController deductionsController = TextEditingController();
  double netSalary = 0;

  void calculateSalary() {
    final basic = double.tryParse(basicSalaryController.text) ?? 0;
    final allowances = double.tryParse(allowancesController.text) ?? 0;
    final deductions = double.tryParse(deductionsController.text) ?? 0;

    setState(() {
      netSalary = basic + allowances - deductions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calculate Net Salary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Basic Salary
            TextField(
              controller: basicSalaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Basic Salary',
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Allowances
            TextField(
              controller: allowancesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Allowances (HRA, DA, etc.)',
                prefixIcon: const Icon(Icons.add_circle_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Deductions
            TextField(
              controller: deductionsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Deductions (PF, Tax, etc.)',
                prefixIcon: const Icon(Icons.remove_circle_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculateSalary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Calculate', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),

            // Result Card
            if (netSalary > 0)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade700, Colors.green.shade500],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Net Salary',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${netSalary.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.white38),
                    const SizedBox(height: 16),
                    _buildBreakdownRow(
                      'Basic Salary',
                      basicSalaryController.text,
                    ),
                    _buildBreakdownRow('Allowances', allowancesController.text),
                    _buildBreakdownRow(
                      'Deductions',
                      '- ${deductionsController.text}',
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(
            '₹$value',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Training Resources Screen
class TrainingResourcesScreen extends StatelessWidget {
  const TrainingResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Resources'),
        backgroundColor: Colors.orange.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add new resource
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'YouTube Tutorials',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildResourceCard(
            'CRM System Training',
            'Complete guide to using the CRM',
            'https://youtube.com/watch?v=example1',
            Icons.video_library,
            Colors.red,
          ),
          _buildResourceCard(
            'Sales Techniques Masterclass',
            'Advanced sales strategies',
            'https://youtube.com/watch?v=example2',
            Icons.video_library,
            Colors.red,
          ),
          const SizedBox(height: 24),

          const Text(
            'Learning Links',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildResourceCard(
            'Product Knowledge Base',
            'Complete product documentation',
            'https://docs.example.com',
            Icons.book,
            Colors.blue,
          ),
          _buildResourceCard(
            'Communication Skills',
            'Udemy course on professional communication',
            'https://udemy.com/course/example',
            Icons.school,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(
    String title,
    String description,
    String link,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Text(
                  link,
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    decoration: TextDecoration.underline,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

// Document Locker Screen
class DocumentLockerScreen extends StatefulWidget {
  const DocumentLockerScreen({Key? key}) : super(key: key);

  @override
  State<DocumentLockerScreen> createState() => _DocumentLockerScreenState();
}

class _DocumentLockerScreenState extends State<DocumentLockerScreen> {
  bool isLocked = true;

  void unlockLocker() {
    // In real app, show OTP/password dialog
    setState(() {
      isLocked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Locker'),
        backgroundColor: Colors.red.shade700,
      ),
      body: isLocked ? _buildLockedView() : _buildUnlockedView(),
    );
  }

  Widget _buildLockedView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 100, color: Colors.red.shade300),
            const SizedBox(height: 24),
            const Text(
              'Secure Document Storage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Your documents are protected with password/OTP authentication',
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: unlockLocker,
              icon: const Icon(Icons.lock_open),
              label: const Text('Unlock with OTP'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnlockedView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Documents',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.red),
              onPressed: () {
                // Upload document
              },
            ),
          ],
        ),
        const SizedBox(height: 16),

        _buildDocumentCard(
          'Resume.pdf',
          '1.2 MB',
          '15 Jan 2025',
          Icons.description,
        ),
        _buildDocumentCard(
          'Offer Letter.pdf',
          '890 KB',
          '10 Jan 2025',
          Icons.assignment,
        ),
        _buildDocumentCard(
          'ID Proof.pdf',
          '450 KB',
          '08 Jan 2025',
          Icons.badge,
        ),
        _buildDocumentCard(
          'Policy Documents.pdf',
          '2.1 MB',
          '05 Jan 2025',
          Icons.policy,
        ),
        _buildDocumentCard(
          'Certificates.pdf',
          '1.8 MB',
          '02 Jan 2025',
          Icons.card_membership,
        ),

        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              isLocked = true;
            });
          },
          icon: const Icon(Icons.lock),
          label: const Text('Lock Locker'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentCard(
    String name,
    String size,
    String date,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$size • $date',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Show options (download, delete, share)
            },
          ),
        ],
      ),
    );
  }
}

// Training & Test Screen
class TrainingTestScreen extends StatelessWidget {
  const TrainingTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training & Tests'),
        backgroundColor: Colors.teal.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'SOP-Based Training',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildTestCard(
            'CRM System Operations',
            'Complete the test to get certified',
            90,
            'Passed',
            Colors.green,
            true,
          ),
          _buildTestCard(
            'Customer Service Standards',
            '15 questions • 30 minutes',
            0,
            'Not Started',
            Colors.grey,
            false,
          ),
          _buildTestCard(
            'Data Privacy & Security',
            '20 questions • 40 minutes',
            65,
            'Failed - Retake Available',
            Colors.red,
            true,
          ),
          _buildTestCard(
            'Sales Process Training',
            '10 questions • 20 minutes',
            85,
            'Passed',
            Colors.green,
            true,
          ),

          const SizedBox(height: 24),
          const Text(
            'AI-Generated Practice Tests',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildPracticeTestCard('Product Knowledge Quiz', 'Easy', Colors.blue),
          _buildPracticeTestCard(
            'Advanced Sales Scenarios',
            'Hard',
            Colors.orange,
          ),
          _buildPracticeTestCard(
            'Company Policy Review',
            'Medium',
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildTestCard(
    String title,
    String description,
    int score,
    String status,
    Color statusColor,
    bool isCompleted,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          if (isCompleted && score > 0) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: score / 100,
                    backgroundColor: Colors.grey.shade200,
                    color: statusColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$score%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Start or retake test
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(isCompleted ? 'View Results' : 'Start Test'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeTestCard(String title, String difficulty, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.quiz, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Difficulty: $difficulty',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: color),
        ],
      ),
    );
  }
}

// WFH Monitor Screen
class WFHMonitorScreen extends StatelessWidget {
  const WFHMonitorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work From Home Monitor'),
        backgroundColor: Colors.indigo.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // WFH Status Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade700, Colors.indigo.shade500],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Icon(Icons.home_work, color: Colors.white, size: 48),
                const SizedBox(height: 12),
                const Text(
                  'Working From Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Active Session',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildWFHStat('Hours Today', '6.5h'),
                    _buildWFHStat('Tasks Done', '8/12'),
                    _buildWFHStat('Productivity', '87%'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Remote Tools Access
          const Text(
            'Remote Tools',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildToolCard(
            'VPN Connection',
            'Connected',
            Icons.vpn_lock,
            Colors.green,
            true,
          ),
          _buildToolCard(
            'Screen Monitoring',
            'Active',
            Icons.screen_share,
            Colors.blue,
            true,
          ),
          _buildToolCard(
            'Time Tracker',
            'Running',
            Icons.timer,
            Colors.orange,
            true,
          ),
          _buildToolCard(
            'Task Manager',
            'Available',
            Icons.task,
            Colors.purple,
            false,
          ),

          const SizedBox(height: 24),

          // Today's Activity
          const Text(
            'Today\'s Activity Log',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildActivityLog('Started work session', '09:00 AM'),
          _buildActivityLog('Completed task: Client follow-up', '10:30 AM'),
          _buildActivityLog('Joined team meeting', '11:00 AM'),
          _buildActivityLog('Break time', '01:00 PM'),
          _buildActivityLog('Resumed work', '01:45 PM'),
        ],
      ),
    );
  }

  Widget _buildWFHStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildToolCard(
    String name,
    String status,
    IconData icon,
    Color color,
    bool isActive,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(status, style: TextStyle(fontSize: 12, color: color)),
              ],
            ),
          ),
          if (isActive)
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }

  Widget _buildActivityLog(String activity, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.indigo.shade300),
          const SizedBox(width: 12),
          Expanded(child: Text(activity)),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

// Certificates Screen
class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Certificates'),
        backgroundColor: Colors.amber.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Achievement Certificates',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Auto-generated on 100% task completion',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildCertificateCard(
            'Employee of the Month',
            'January 2025',
            '100% task completion',
            Colors.amber,
          ),
          _buildCertificateCard(
            'Outstanding Performance',
            'December 2024',
            '95% monthly achievement',
            Colors.blue,
          ),
          _buildCertificateCard(
            'Team Player Award',
            'November 2024',
            'Exceptional collaboration',
            Colors.purple,
          ),

          const SizedBox(height: 24),

          const Text(
            'Training Certificates',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildCertificateCard(
            'CRM Mastery',
            'Completed 10 Jan 2025',
            'Score: 90%',
            Colors.green,
          ),
          _buildCertificateCard(
            'Sales Excellence',
            'Completed 05 Jan 2025',
            'Score: 85%',
            Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(
    String title,
    String date,
    String detail,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.card_membership, color: color, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.download),
                color: color,
                onPressed: () {
                  // Download certificate
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: color,
                onPressed: () {
                  // Share certificate
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
