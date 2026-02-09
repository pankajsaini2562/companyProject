import 'package:flutter/material.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

class FeedbackSuggestionsScreen extends StatefulWidget {
  const FeedbackSuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackSuggestionsScreen> createState() =>
      _FeedbackSuggestionsScreenState();
}

class _FeedbackSuggestionsScreenState extends State<FeedbackSuggestionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Get feedback color based on indicator (Feature #22)
  Color _getFeedbackColor(String indicator) {
    switch (indicator.toLowerCase()) {
      case 'green':
        return const Color(0xFF10B981); // Positive
      case 'red':
        return const Color(0xFFEF4444); // Negative
      case 'blue':
        return const Color(0xFF3B82F6); // Neutral
      default:
        return const Color(0xFF64748B);
    }
  }

  IconData _getFeedbackIcon(String indicator) {
    switch (indicator.toLowerCase()) {
      case 'green':
        return Icons.sentiment_satisfied;
      case 'red':
        return Icons.sentiment_dissatisfied;
      case 'blue':
        return Icons.sentiment_neutral;
      default:
        return Icons.feedback;
    }
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
          'Feedback & Suggestions',
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
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF3B82F6),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF3B82F6),
          isScrollable: true,
          tabs: const [
            Tab(text: 'Customer Feedback'),
            Tab(text: 'Customer Suggestions'),
            Tab(text: 'Partner Suggestions'),
            Tab(text: 'Staff Suggestions'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Statistics Overview
          _buildStatisticsOverview(),
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCustomerFeedbackTab(),
                _buildCustomerSuggestionsTab(),
                _buildPartnerSuggestionsTab(),
                _buildStaffSuggestionsTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddFeedbackDialog();
        },
        backgroundColor: const Color(0xFF3B82F6),
        icon: const Icon(Icons.add),
        label: const Text('Add Feedback'),
      ),
    );
  }

  Widget _buildStatisticsOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Positive',
              '85',
              const Color(0xFF10B981),
              Icons.sentiment_satisfied,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Neutral',
              '32',
              const Color(0xFF3B82F6),
              Icons.sentiment_neutral,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Negative',
              '12',
              const Color(0xFFEF4444),
              Icons.sentiment_dissatisfied,
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
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // CUSTOMER FEEDBACK TAB (Feature #22)
  Widget _buildCustomerFeedbackTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Auto-sent Feedback Info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Auto-Sent Feedback Forms',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Sent after loan sanction',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'Recent Feedback',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),

        // Green Feedback - Positive
        _buildFeedbackCard(
          customerName: 'John Doe',
          loanId: 'LOAN001234',
          sanctionDate: '2024-02-01',
          rating: 5,
          indicator: 'Green',
          feedback:
              'Excellent service! Very quick processing and helpful staff.',
          submittedDate: '2024-02-05',
        ),
        const SizedBox(height: 12),

        // Blue Feedback - Neutral
        _buildFeedbackCard(
          customerName: 'Sarah Smith',
          loanId: 'LOAN001235',
          sanctionDate: '2024-02-03',
          rating: 3,
          indicator: 'Blue',
          feedback: 'Good service, but processing took longer than expected.',
          submittedDate: '2024-02-06',
        ),
        const SizedBox(height: 12),

        // Red Feedback - Negative
        _buildFeedbackCard(
          customerName: 'Mike Johnson',
          loanId: 'LOAN001236',
          sanctionDate: '2024-01-28',
          rating: 2,
          indicator: 'Red',
          feedback:
              'Had issues with documentation. Communication could be better.',
          submittedDate: '2024-02-02',
        ),
        const SizedBox(height: 12),

        // Green Feedback - Positive
        _buildFeedbackCard(
          customerName: 'Emma Wilson',
          loanId: 'LOAN001237',
          sanctionDate: '2024-02-04',
          rating: 5,
          indicator: 'Green',
          feedback: 'Outstanding experience! Very professional team.',
          submittedDate: '2024-02-07',
        ),
      ],
    );
  }

  Widget _buildFeedbackCard({
    required String customerName,
    required String loanId,
    required String sanctionDate,
    required int rating,
    required String indicator,
    required String feedback,
    required String submittedDate,
  }) {
    final color = _getFeedbackColor(indicator);
    final icon = _getFeedbackIcon(indicator);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.1),
                child: Text(
                  customerName[0],
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      loanId,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(icon, size: 16, color: color),
                    const SizedBox(width: 4),
                    Text(
                      indicator,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Rating Stars
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: const Color(0xFFF59E0B),
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 12),

          // Feedback Text
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              feedback,
              style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
            ),
          ),
          const SizedBox(height: 12),

          // Metadata
          Row(
            children: [
              const Icon(Icons.event, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 4),
              Text(
                'Loan Sanctioned: $sanctionDate',
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
              const Spacer(),
              const Icon(Icons.access_time, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 4),
              Text(
                'Submitted: $submittedDate',
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CUSTOMER SUGGESTIONS TAB (Feature #23 - Customer Folder)
  Widget _buildCustomerSuggestionsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFolderHeader(
          'Customer Suggestions',
          Icons.lightbulb,
          const Color(0xFF3B82F6),
        ),
        const SizedBox(height: 16),
        _buildSuggestionCard(
          name: 'John Doe',
          type: 'Customer',
          title: 'Mobile App Feature',
          suggestion:
              'Would love to see a mobile app for easier loan tracking and document uploads.',
          category: 'Product',
          date: '2024-02-07',
          status: 'Under Review',
          statusColor: const Color(0xFFF59E0B),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'Sarah Smith',
          type: 'Customer',
          title: 'Faster Processing',
          suggestion:
              'The loan processing could be faster. Maybe add express processing option?',
          category: 'Process',
          date: '2024-02-06',
          status: 'In Progress',
          statusColor: const Color(0xFF3B82F6),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'Mike Johnson',
          type: 'Customer',
          title: 'Better Communication',
          suggestion:
              'More frequent updates via WhatsApp about loan status would be helpful.',
          category: 'Communication',
          date: '2024-02-05',
          status: 'Implemented',
          statusColor: const Color(0xFF10B981),
        ),
      ],
    );
  }

  // PARTNER SUGGESTIONS TAB (Feature #23 - Partner Folder)
  Widget _buildPartnerSuggestionsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFolderHeader(
          'Partner Suggestions',
          Icons.handshake,
          const Color(0xFF8B5CF6),
        ),
        const SizedBox(height: 16),
        _buildSuggestionCard(
          name: 'ABC Finance Partners',
          type: 'Partner',
          title: 'Commission Structure',
          suggestion:
              'Consider tiered commission structure based on volume to incentivize higher performance.',
          category: 'Commission',
          date: '2024-02-06',
          status: 'Under Review',
          statusColor: const Color(0xFFF59E0B),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'XYZ Loan Associates',
          type: 'Partner',
          title: 'Partner Portal',
          suggestion:
              'A dedicated partner portal with real-time tracking would improve efficiency.',
          category: 'Technology',
          date: '2024-02-04',
          status: 'Planned',
          statusColor: const Color(0xFF3B82F6),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'DEF Consultants',
          type: 'Partner',
          title: 'Training Programs',
          suggestion:
              'Monthly training sessions on new products would help us serve customers better.',
          category: 'Training',
          date: '2024-02-03',
          status: 'Implemented',
          statusColor: const Color(0xFF10B981),
        ),
      ],
    );
  }

  // STAFF SUGGESTIONS TAB (Feature #23 - Staff Folder)
  Widget _buildStaffSuggestionsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFolderHeader(
          'Staff Suggestions',
          Icons.groups,
          const Color(0xFF10B981),
        ),
        const SizedBox(height: 16),
        _buildSuggestionCard(
          name: 'Emily Brown (Sales)',
          type: 'Staff',
          title: 'CRM Integration',
          suggestion:
              'Integration with popular CRM tools would streamline our workflow significantly.',
          category: 'Technology',
          date: '2024-02-07',
          status: 'Under Review',
          statusColor: const Color(0xFFF59E0B),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'David Wilson (Operations)',
          type: 'Staff',
          title: 'Automated Reports',
          suggestion:
              'Automated daily/weekly reports would save hours of manual work.',
          category: 'Automation',
          date: '2024-02-06',
          status: 'In Progress',
          statusColor: const Color(0xFF3B82F6),
        ),
        const SizedBox(height: 12),
        _buildSuggestionCard(
          name: 'Lisa Anderson (HR)',
          type: 'Staff',
          title: 'Remote Work Tools',
          suggestion:
              'Better remote work tools and WFH monitoring would improve productivity.',
          category: 'WFH',
          date: '2024-02-05',
          status: 'Implemented',
          statusColor: const Color(0xFF10B981),
        ),
      ],
    );
  }

  Widget _buildFolderHeader(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const Text(
                  'Separate folder for organized tracking',
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard({
    required String name,
    required String type,
    required String title,
    required String suggestion,
    required String category,
    required String date,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFF3B82F6),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
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
          const SizedBox(height: 12),

          // Suggestion Text
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              suggestion,
              style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
            ),
          ),
          const SizedBox(height: 12),

          // Metadata
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8B5CF6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_today,
                size: 12,
                color: Color(0xFF64748B),
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // DIALOGS

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
              leading: Radio<String>(
                value: 'All',
                groupValue: 'All',
                onChanged: (value) {
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Positive (Green)'),
              leading: Radio<String>(
                value: 'Green',
                groupValue: 'All',
                onChanged: (value) {
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Neutral (Blue)'),
              leading: Radio<String>(
                value: 'Blue',
                groupValue: 'All',
                onChanged: (value) {
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Negative (Red)'),
              leading: Radio<String>(
                value: 'Red',
                groupValue: 'All',
                onChanged: (value) {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFeedbackDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Feedback/Suggestion'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Type',
                  prefixIcon: Icon(Icons.category),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'customer_feedback',
                    child: Text('Customer Feedback'),
                  ),
                  DropdownMenuItem(
                    value: 'customer_suggestion',
                    child: Text('Customer Suggestion'),
                  ),
                  DropdownMenuItem(
                    value: 'partner_suggestion',
                    child: Text('Partner Suggestion'),
                  ),
                  DropdownMenuItem(
                    value: 'staff_suggestion',
                    child: Text('Staff Suggestion'),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Feedback/Suggestion',
                  prefixIcon: Icon(Icons.message),
                ),
                maxLines: 4,
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
                const SnackBar(
                  content: Text('Feedback submitted successfully!'),
                ),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
