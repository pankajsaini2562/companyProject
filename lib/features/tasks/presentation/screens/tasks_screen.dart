import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FlutterTts flutterTts = FlutterTts();
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initTTS();
  }

  void _initTTS() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    _tabController.dispose();
    flutterTts.stop();
    super.dispose();
  }

  Color _getTaskColor(String status, int minutesUntilDeadline) {
    // Feature #12: Color-coded task system
    if (status == 'Processing') return const Color(0xFF3B82F6); // Blue
    if (minutesUntilDeadline < 0)
      return const Color(0xFFEF4444); // Red - Overdue
    if (minutesUntilDeadline <= 90)
      return const Color(0xFFF59E0B); // Orange - 90 min before deadline
    return const Color(0xFF10B981); // Green - On track
  }

  String _getStatusText(String status, int minutesUntilDeadline) {
    if (status == 'Processing') return 'Processing/Try Again';
    if (minutesUntilDeadline < 0) return 'Overdue';
    if (minutesUntilDeadline <= 90) return 'Due Soon';
    return 'On Track';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF64748B)),
            onPressed: () {
              _showFilterDialog();
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort, color: Color(0xFF64748B)),
            onPressed: () {
              _showSortDialog();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF3B82F6),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF3B82F6),
          isScrollable: true,
          tabs: const [
            Tab(text: 'All Tasks'),
            Tab(text: 'My Tasks'),
            Tab(text: 'Team Tasks'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Task Statistics
          _buildTaskStats(),
          // Task List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllTasksTab(),
                _buildMyTasksTab(),
                _buildTeamTasksTab(),
                _buildCompletedTasksTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddTaskDialog();
        },
        backgroundColor: const Color(0xFF3B82F6),
        icon: const Icon(Icons.add),
        label: const Text('New Task'),
      ),
    );
  }

  Widget _buildTaskStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'On Track',
              '24',
              const Color(0xFF10B981),
              Icons.check_circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Due Soon',
              '8',
              const Color(0xFFF59E0B),
              Icons.warning_amber,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Overdue',
              '3',
              const Color(0xFFEF4444),
              Icons.error,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Processing',
              '5',
              const Color(0xFF3B82F6),
              Icons.autorenew,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Color(0xFF64748B)),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAllTasksTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Green Task - On Track
        _buildTaskCard(
          title: 'Complete CIBIL verification for John Doe',
          assignedTo: 'You',
          deadline: DateTime.now().add(const Duration(hours: 5)),
          progress: 0.65,
          status: 'Active',
          priority: 'High',
          taskId: 'TASK001',
        ),
        const SizedBox(height: 12),

        // Orange Task - 90 min before deadline
        _buildTaskCard(
          title: 'Review loan application - Sarah Smith',
          assignedTo: 'You',
          deadline: DateTime.now().add(const Duration(minutes: 75)),
          progress: 0.82,
          status: 'Active',
          priority: 'Urgent',
          taskId: 'TASK002',
        ),
        const SizedBox(height: 12),

        // Red Task - Overdue
        _buildTaskCard(
          title: 'Submit GST returns for ABC Corp',
          assignedTo: 'Team Member',
          deadline: DateTime.now().subtract(const Duration(hours: 2)),
          progress: 0.45,
          status: 'Active',
          priority: 'Critical',
          taskId: 'TASK003',
        ),
        const SizedBox(height: 12),

        // Blue Task - Processing/Try Again
        _buildTaskCard(
          title: 'ITR verification - Mike Johnson',
          assignedTo: 'You',
          deadline: DateTime.now().add(const Duration(hours: 3)),
          progress: 0.55,
          status: 'Processing',
          priority: 'Medium',
          taskId: 'TASK004',
        ),
        const SizedBox(height: 12),

        _buildTaskCard(
          title: 'Banking document collection',
          assignedTo: 'Team Member',
          deadline: DateTime.now().add(const Duration(days: 1)),
          progress: 0.30,
          status: 'Active',
          priority: 'Low',
          taskId: 'TASK005',
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String assignedTo,
    required DateTime deadline,
    required double progress,
    required String status,
    required String priority,
    required String taskId,
  }) {
    final now = DateTime.now();
    final minutesUntilDeadline = deadline.difference(now).inMinutes;
    final taskColor = _getTaskColor(status, minutesUntilDeadline);
    final statusText = _getStatusText(status, minutesUntilDeadline);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: taskColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _speak(title);
                      },
                      icon: const Icon(Icons.volume_up, size: 20),
                      color: const Color(0xFF3B82F6),
                      tooltip: 'Text-to-Speech',
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Status and Priority
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: taskColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: taskColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getPriorityColor(priority).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        priority,
                        style: TextStyle(
                          color: _getPriorityColor(priority),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Task Details
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      assignedTo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDeadline(deadline),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: taskColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(taskColor),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _updateProgress(title, progress, taskId);
                        },
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Update'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF3B82F6),
                          side: const BorderSide(color: Color(0xFF3B82F6)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (status == 'Active')
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _moveToProcessing(title, taskId);
                          },
                          icon: const Icon(Icons.autorenew, size: 16),
                          label: const Text('Processing'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF3B82F6),
                            side: const BorderSide(color: Color(0xFF3B82F6)),
                          ),
                        ),
                      ),
                    if (status == 'Processing')
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              // Move back to active
                            });
                          },
                          icon: const Icon(Icons.play_arrow, size: 16),
                          label: const Text('Resume'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF10B981),
                            side: const BorderSide(color: Color(0xFF10B981)),
                          ),
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

  String _formatDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      final hours = difference.inHours.abs();
      if (hours < 1) return '${difference.inMinutes.abs()}m overdue';
      if (hours < 24) return '${hours}h overdue';
      return '${difference.inDays.abs()}d overdue';
    }

    final hours = difference.inHours;
    if (hours < 1) return '${difference.inMinutes}m left';
    if (hours < 24) return '${hours}h left';
    return '${difference.inDays}d left';
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'critical':
        return const Color(0xFFEF4444);
      case 'urgent':
        return const Color(0xFFF59E0B);
      case 'high':
        return const Color(0xFF8B5CF6);
      case 'medium':
        return const Color(0xFF3B82F6);
      default:
        return const Color(0xFF64748B);
    }
  }

  void _updateProgress(
    String taskTitle,
    double currentProgress,
    String taskId,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        double newProgress = currentProgress;
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Update Progress'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(newProgress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B82F6),
                    ),
                  ),
                  Slider(
                    value: newProgress,
                    onChanged: (value) {
                      setDialogState(() {
                        newProgress = value;
                      });
                    },
                    activeColor: const Color(0xFF3B82F6),
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
                    setState(() {
                      // Update progress
                    });

                    // Check for motivational popup (80% completion)
                    if (newProgress >= 0.80 && currentProgress < 0.80) {
                      _showMotivationalPopup();
                    }

                    // Check for certificate (100% completion)
                    if (newProgress >= 1.0) {
                      _showCertificateDialog(taskTitle, taskId);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Progress updated to ${(newProgress * 100).toInt()}%',
                        ),
                      ),
                    );
                  },
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showMotivationalPopup() {
    // Feature #12: Motivational popup at 80% completion
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration, size: 64, color: Color(0xFFF59E0B)),
            const SizedBox(height: 16),
            const Text(
              'Almost There!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'You\'re doing great! Just a little more to go. Keep up the excellent work!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Text('Continue!'),
            ),
          ],
        ),
      ),
    );

    _speak('Almost there! You are doing great! Just a little more to go.');
  }

  void _showCertificateDialog(String taskTitle, String taskId) {
    // Feature #12: Auto-generated appreciation certificate at 100%
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.workspace_premium,
              size: 80,
              color: Color(0xFFF59E0B),
            ),
            const SizedBox(height: 16),
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Task Completed Successfully!',
              style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Certificate of Achievement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Task ID: $taskId',
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    taskTitle,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Completed: ${DateTime.now().toString().split('.')[0]}',
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Certificate downloaded!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Download'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF3B82F6),
                      side: const BorderSide(color: Color(0xFF3B82F6)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Done'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    _speak('Congratulations! Task completed successfully!');
  }

  void _moveToProcessing(String taskTitle, String taskId) {
    setState(() {
      // Move task to processing status (Blue)
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task moved to Processing/Try Again'),
        backgroundColor: Color(0xFF3B82F6),
      ),
    );
  }

  Widget _buildMyTasksTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Your personal tasks',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamTasksTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.groups, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Team tasks',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTasksTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Completed tasks',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Tasks'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All Tasks'),
              leading: Radio<String>(
                value: 'All',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('On Track (Green)'),
              leading: Radio<String>(
                value: 'Green',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Due Soon (Orange)'),
              leading: Radio<String>(
                value: 'Orange',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Overdue (Red)'),
              leading: Radio<String>(
                value: 'Red',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Processing (Blue)'),
              leading: Radio<String>(
                value: 'Blue',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort By'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Deadline'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.priority_high),
              title: const Text('Priority'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Progress'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Task'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  prefixIcon: Icon(Icons.task),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  prefixIcon: Icon(Icons.flag),
                ),
                items: const [
                  DropdownMenuItem(value: 'Low', child: Text('Low')),
                  DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                  DropdownMenuItem(value: 'High', child: Text('High')),
                  DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
                  DropdownMenuItem(value: 'Critical', child: Text('Critical')),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task created successfully!')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
