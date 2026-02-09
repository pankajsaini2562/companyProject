import 'package:flutter/material.dart';

// ==================== EMPLOYEE DASHBOARD SECTION ====================
// This includes features from points 12, 17, 18, 19, 24, 25, 27, 28, 29, 30

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({Key? key}) : super(key: key);

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C3E7C), Color(0xFF4A5F9D)],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 32,
                          color: Color(0xFF2C3E7C),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Priya Sharma',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Sales Manager • EMP-1045',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quick Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickStat('KPI Score', '87%', Icons.star),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildQuickStat('Tasks', '12/15', Icons.task_alt),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildQuickStat(
                        'Attendance',
                        '95%',
                        Icons.calendar_today,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: const Color(0xFF2C3E7C),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF2C3E7C),
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Tasks'),
                Tab(text: 'Attendance'),
                Tab(text: 'Training'),
                Tab(text: 'Documents'),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                _buildTasksTab(),
                _buildAttendanceTab(),
                _buildTrainingTab(),
                _buildDocumentsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
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

  // Overview Tab - Point #24: Admin dashboard with KPIs
  Widget _buildOverviewTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Performance KPI Card - Point #19
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C3E7C), Color(0xFF4A5F9D)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Performance KPI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Excellent',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: [
                        Center(
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              value: 0.87,
                              strokeWidth: 12,
                              backgroundColor: Colors.white24,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            '87%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildKpiMetric('Sales', '92%', Colors.greenAccent),
                  _buildKpiMetric('Quality', '85%', Colors.yellowAccent),
                  _buildKpiMetric('Punctuality', '95%', Colors.greenAccent),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Today's Summary
        const Text(
          'Today\'s Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Tasks Complete',
                '8/12',
                Icons.task_alt,
                Colors.green,
                '67%',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Calls Made',
                '24',
                Icons.phone,
                Colors.blue,
                '+12',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Meetings',
                '3',
                Icons.event,
                Colors.orange,
                'Today',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Working Hours',
                '7.5h',
                Icons.access_time,
                Colors.purple,
                'Active',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Salary Calculator - Point #17
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Salary Breakdown',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SalaryCalculatorScreen(),
                        ),
                      );
                    },
                    child: const Text('View Calculator'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildSalaryRow('Base Salary', '₹50,000'),
              _buildSalaryRow('Incentives', '₹8,500', color: Colors.green),
              _buildSalaryRow('Allowances', '₹5,000'),
              const Divider(height: 24),
              _buildSalaryRow('Deductions', '-₹4,200', color: Colors.red),
              const Divider(height: 24),
              _buildSalaryRow(
                'Net Salary',
                '₹59,300',
                isTotal: true,
                color: const Color(0xFF2C3E7C),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Quick Actions
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
          children: [
            _buildActionButton(
              'Mark Attendance',
              Icons.fingerprint,
              Colors.green,
              () {
                // Mark attendance
              },
            ),
            _buildActionButton(
              'Apply Leave',
              Icons.beach_access,
              Colors.orange,
              () {
                // Apply leave
              },
            ),
            _buildActionButton(
              'Helpdesk',
              Icons.support_agent,
              Colors.blue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpdeskScreen()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKpiMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
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

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryRow(
    String label,
    String amount, {
    bool isTotal = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 18 : 15,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tasks Tab - Point #12: Advanced CRM Tools with deadline tracking
  Widget _buildTasksTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Tasks',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Tasks with color-coded deadlines
        _buildTaskCard(
          title: 'Follow up with Client - Rajesh Kumar',
          deadline: DateTime.now().add(const Duration(hours: 2)),
          priority: 'High',
          status: TaskStatus.green,
          description: 'Discuss loan approval status',
        ),
        _buildTaskCard(
          title: 'Upload CIBIL report for LN-2024-045',
          deadline: DateTime.now().add(const Duration(minutes: 45)),
          priority: 'Urgent',
          status: TaskStatus.orange,
          description: 'Document verification pending',
        ),
        _buildTaskCard(
          title: 'Complete sales report for January',
          deadline: DateTime.now().subtract(const Duration(hours: 2)),
          priority: 'High',
          status: TaskStatus.red,
          description: 'Overdue - submit ASAP',
        ),
        _buildTaskCard(
          title: 'Prepare presentation for team meeting',
          deadline: DateTime.now().add(const Duration(days: 2)),
          priority: 'Medium',
          status: TaskStatus.green,
          description: 'Due in 2 days',
        ),
        _buildTaskCard(
          title: 'Review loan applications',
          deadline: DateTime.now().add(const Duration(hours: 1)),
          priority: 'Medium',
          status: TaskStatus.blue,
          description: 'In processing - Try again later',
          isProcessing: true,
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required DateTime deadline,
    required String priority,
    required TaskStatus status,
    required String description,
    bool isProcessing = false,
  }) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (status) {
      case TaskStatus.green:
        statusColor = Colors.green;
        statusText = 'On Track';
        statusIcon = Icons.check_circle;
        break;
      case TaskStatus.orange:
        statusColor = Colors.orange;
        statusText = '90 min to deadline';
        statusIcon = Icons.warning;
        break;
      case TaskStatus.red:
        statusColor = Colors.red;
        statusText = 'Overdue';
        statusIcon = Icons.error;
        break;
      case TaskStatus.blue:
        statusColor = Colors.blue;
        statusText = 'Processing';
        statusIcon = Icons.refresh;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Icon(statusIcon, color: statusColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(priority).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    priority,
                    style: TextStyle(
                      color: _getPriorityColor(priority),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formatDeadline(deadline),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: statusColor,
                          side: BorderSide(color: statusColor),
                        ),
                        child: const Text('View Details'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: statusColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(isProcessing ? 'Try Again' : 'Complete'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Urgent':
        return Colors.red;
      case 'High':
        return Colors.orange;
      case 'Medium':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _formatDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      return 'Overdue by ${difference.inHours.abs()}h';
    } else if (difference.inHours < 24) {
      return 'Due in ${difference.inHours}h ${difference.inMinutes.remainder(60)}m';
    } else {
      return 'Due in ${difference.inDays} days';
    }
  }

  // Attendance Tab - Point #18: Google location tracking + attendance
  Widget _buildAttendanceTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Today's Attendance
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Text(
                'Today\'s Attendance',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAttendanceTime('Check-In', '09:15 AM', Icons.login),
                  Container(width: 2, height: 50, color: Colors.white24),
                  _buildAttendanceTime('Check-Out', '--:--', Icons.logout),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 16),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'Office - Rajpur Road, Dehradun',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View Map',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Monthly Summary
        const Text(
          'This Month',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _buildAttendanceStat(
                'Present',
                '19',
                Icons.check_circle,
                Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildAttendanceStat(
                'Absent',
                '1',
                Icons.cancel,
                Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildAttendanceStat(
                'Late',
                '3',
                Icons.warning,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildAttendanceStat(
                'Half Day',
                '2',
                Icons.schedule,
                Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Location History
        const Text(
          'Location History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        _buildLocationHistoryItem(
          date: '09 Feb 2026',
          checkIn: '09:15 AM',
          checkOut: 'Active',
          location: 'Office - Rajpur Road',
          status: 'On Time',
          statusColor: Colors.green,
        ),
        _buildLocationHistoryItem(
          date: '08 Feb 2026',
          checkIn: '09:28 AM',
          checkOut: '06:15 PM',
          location: 'Office - Rajpur Road',
          status: 'Late',
          statusColor: Colors.orange,
        ),
        _buildLocationHistoryItem(
          date: '07 Feb 2026',
          checkIn: '09:05 AM',
          checkOut: '06:10 PM',
          location: 'Client Visit - Clement Town',
          status: 'Field Work',
          statusColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildAttendanceTime(String label, String time, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildAttendanceStat(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
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
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationHistoryItem({
    required String date,
    required String checkIn,
    required String checkOut,
    required String location,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.login, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(checkIn, style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.logout, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(checkOut, style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                location,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Training Tab - Points #27, #29: Training resources and SOP-based tests
  Widget _buildTrainingTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Training & Development',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Active Courses
        _buildTrainingCard(
          title: 'Sales Techniques Masterclass',
          progress: 65,
          duration: '4 weeks',
          icon: Icons.sell,
          color: Colors.blue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TrainingDetailScreen()),
            );
          },
        ),
        _buildTrainingCard(
          title: 'Customer Service Excellence',
          progress: 100,
          duration: 'Completed',
          icon: Icons.support_agent,
          color: Colors.green,
          isCompleted: true,
          onTap: () {},
        ),
        _buildTrainingCard(
          title: 'Loan Processing SOP',
          progress: 30,
          duration: '2 weeks',
          icon: Icons.description,
          color: Colors.orange,
          onTap: () {},
        ),

        const SizedBox(height: 20),

        // SOP Tests - Point #29
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C3E7C), Color(0xFF4A5F9D)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.quiz, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'SOP Knowledge Tests',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Complete these AI-generated tests to verify your understanding',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SOPTestScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2C3E7C),
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text(
                  'Start New Test',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Learning Resources - Point #27
        const Text(
          'Learning Resources',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        _buildResourceCard(
          title: 'YouTube Tutorials',
          subtitle: '45 videos available',
          icon: Icons.play_circle,
          color: Colors.red,
        ),
        _buildResourceCard(
          title: 'Documentation',
          subtitle: '120+ articles',
          icon: Icons.article,
          color: Colors.blue,
        ),
        _buildResourceCard(
          title: 'Webinars',
          subtitle: 'Live sessions',
          icon: Icons.video_call,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildTrainingCard({
    required String title,
    required int progress,
    required String duration,
    required IconData icon,
    required Color color,
    bool isCompleted = false,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: color, size: 24),
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
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            duration,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isCompleted)
                      const Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          '$progress%',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResourceCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
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
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  // Documents Tab - Point #28: HR Document Locker
  Widget _buildDocumentsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Secure Access Banner
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber),
          ),
          child: const Row(
            children: [
              Icon(Icons.lock, color: Colors.amber, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Secured with Password/OTP Protection',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'My Documents',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        _buildDocumentItem(
          title: 'Resume',
          date: 'Updated: 15 Jan 2026',
          icon: Icons.description,
          color: Colors.blue,
          isLocked: false,
        ),
        _buildDocumentItem(
          title: 'Offer Letter',
          date: 'Issued: 01 Jan 2024',
          icon: Icons.email,
          color: Colors.green,
          isLocked: true,
        ),
        _buildDocumentItem(
          title: 'Employment Contract',
          date: 'Signed: 05 Jan 2024',
          icon: Icons.gavel,
          color: Colors.orange,
          isLocked: true,
        ),
        _buildDocumentItem(
          title: 'PAN Card',
          date: 'Verified',
          icon: Icons.credit_card,
          color: Colors.purple,
          isLocked: false,
        ),
        _buildDocumentItem(
          title: 'Aadhaar Card',
          date: 'Verified',
          icon: Icons.badge,
          color: Colors.teal,
          isLocked: false,
        ),
        _buildDocumentItem(
          title: 'Company Policies',
          date: '120 pages',
          icon: Icons.policy,
          color: Colors.indigo,
          isLocked: true,
        ),
        _buildDocumentItem(
          title: 'Salary Slips',
          date: 'Last 6 months',
          icon: Icons.receipt,
          color: Colors.red,
          isLocked: true,
        ),

        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file),
          label: const Text('Upload New Document'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2C3E7C),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required String date,
    required IconData icon,
    required Color color,
    required bool isLocked,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            if (isLocked) {
              _showSecurityDialog();
            } else {
              // View document
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
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
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLocked)
                  const Icon(Icons.lock, color: Colors.grey, size: 20)
                else
                  const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSecurityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.security, color: Color(0xFF2C3E7C)),
            SizedBox(width: 12),
            Text('Secure Access Required'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter your password or OTP to access this document'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Verify and open document
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2C3E7C),
            ),
            child: const Text('Unlock'),
          ),
        ],
      ),
    );
  }
}

// Task Status Enum
enum TaskStatus { green, orange, red, blue }

// ==================== SUPPORTING SCREENS ====================

// Salary Calculator Screen - Point #17
class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<SalaryCalculatorScreen> createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final _baseSalaryController = TextEditingController(text: '50000');
  final _incentivesController = TextEditingController(text: '8500');
  final _allowancesController = TextEditingController(text: '5000');
  final _deductionsController = TextEditingController(text: '4200');

  double _netSalary = 59300;

  void _calculateSalary() {
    final base = double.tryParse(_baseSalaryController.text) ?? 0;
    final incentives = double.tryParse(_incentivesController.text) ?? 0;
    final allowances = double.tryParse(_allowancesController.text) ?? 0;
    final deductions = double.tryParse(_deductionsController.text) ?? 0;

    setState(() {
      _netSalary = base + incentives + allowances - deductions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
        backgroundColor: const Color(0xFF2C3E7C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calculate Your Salary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildInputField('Base Salary', _baseSalaryController),
            _buildInputField('Incentives', _incentivesController),
            _buildInputField('Allowances', _allowancesController),
            _buildInputField('Deductions', _deductionsController),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculateSalary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E7C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Calculate Net Salary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2C3E7C), Color(0xFF4A5F9D)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Net Salary',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${_netSalary.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixText: '₹ ',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

// Helpdesk Screen - Point #25
class HelpdeskScreen extends StatelessWidget {
  const HelpdeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpdesk & Support'),
        backgroundColor: const Color(0xFF2C3E7C),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tutorial Videos - Point #25
          const Text(
            'Tutorial Videos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildVideoCard(
            title: 'Getting Started with CRM',
            duration: '10:45',
            views: '1.2K',
          ),
          _buildVideoCard(
            title: 'How to Process Loans',
            duration: '15:30',
            views: '856',
          ),
          _buildVideoCard(
            title: 'Document Verification Guide',
            duration: '8:20',
            views: '642',
          ),

          const SizedBox(height: 24),

          // Support Options
          const Text(
            'Need Help?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildSupportOption(
            title: 'Call Support',
            subtitle: '+91 98765 43210',
            icon: Icons.phone,
            color: Colors.green,
          ),
          _buildSupportOption(
            title: 'Email Support',
            subtitle: 'support@company.com',
            icon: Icons.email,
            color: Colors.blue,
          ),
          _buildSupportOption(
            title: 'Live Chat',
            subtitle: 'Available 9 AM - 6 PM',
            icon: Icons.chat,
            color: Colors.orange,
          ),
          _buildSupportOption(
            title: 'Submit Ticket',
            subtitle: 'We\'ll get back within 24hrs',
            icon: Icons.support,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard({
    required String title,
    required String duration,
    required String views,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.play_circle_filled,
            color: Colors.red,
            size: 32,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$duration • $views views'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildSupportOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
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
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

// Training Detail Screen
class TrainingDetailScreen extends StatelessWidget {
  const TrainingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Details'),
        backgroundColor: const Color(0xFF2C3E7C),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Training course content goes here')),
    );
  }
}

// SOP Test Screen - Point #29
class SOPTestScreen extends StatefulWidget {
  const SOPTestScreen({Key? key}) : super(key: key);

  @override
  State<SOPTestScreen> createState() => _SOPTestScreenState();
}

class _SOPTestScreenState extends State<SOPTestScreen> {
  int _currentQuestion = 0;
  final Map<int, int> _answers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the first step in loan application processing?',
      'options': [
        'Document verification',
        'CIBIL score check',
        'Customer registration',
        'Loan approval',
      ],
      'correct': 2,
    },
    {
      'question': 'What is the minimum CIBIL score required for home loans?',
      'options': ['600', '650', '700', '750'],
      'correct': 2,
    },
    {
      'question': 'Which document is mandatory for business loan applications?',
      'options': ['Passport', 'GST Returns', 'Driving License', 'Voter ID'],
      'correct': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (_currentQuestion >= _questions.length) {
      return _buildResultScreen();
    }

    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestion + 1}/${_questions.length}'),
        backgroundColor: const Color(0xFF2C3E7C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF2C3E7C),
              ),
            ),
            const SizedBox(height: 30),

            Text(
              question['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            ...List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Material(
                  color: _answers[_currentQuestion] == index
                      ? const Color(0xFF2C3E7C).withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _answers[_currentQuestion] = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _answers[_currentQuestion] == index
                              ? const Color(0xFF2C3E7C)
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _answers[_currentQuestion] == index
                                    ? const Color(0xFF2C3E7C)
                                    : Colors.grey,
                                width: 2,
                              ),
                              color: _answers[_currentQuestion] == index
                                  ? const Color(0xFF2C3E7C)
                                  : Colors.transparent,
                            ),
                            child: _answers[_currentQuestion] == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              question['options'][index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _answers.containsKey(_currentQuestion)
                    ? () {
                        setState(() {
                          _currentQuestion++;
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E7C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _currentQuestion == _questions.length - 1
                      ? 'Submit Test'
                      : 'Next Question',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    int correct = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_answers[i] == _questions[i]['correct']) {
        correct++;
      }
    }
    final percentage = (correct / _questions.length * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results'),
        backgroundColor: const Color(0xFF2C3E7C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                percentage >= 70 ? Icons.check_circle : Icons.cancel,
                size: 100,
                color: percentage >= 70 ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 20),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You scored $correct out of ${_questions.length}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              if (percentage >= 70)
                const Text(
                  'Congratulations! You passed!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              else
                const Text(
                  'Please retake the test to improve your score',
                  style: TextStyle(fontSize: 18, color: Colors.orange),
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E7C),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
