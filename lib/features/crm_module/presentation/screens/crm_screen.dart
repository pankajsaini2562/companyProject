import 'package:flutter/material.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

class CRMScreen extends StatefulWidget {
  const CRMScreen({Key? key}) : super(key: key);

  @override
  State<CRMScreen> createState() => _CRMScreenState();
}

class _CRMScreenState extends State<CRMScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: const Color(0xFF64748B),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'CRM',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF64748B)),
            onPressed: () {
              _showSearchDialog();
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF64748B)),
            onPressed: () {
              _showFilterDialog();
            },
          ),
          const SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF3B82F6),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF3B82F6),
          tabs: const [
            Tab(text: 'Leads'),
            Tab(text: 'Pipeline'),
            Tab(text: 'Customers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildLeadsTab(), _buildPipelineTab(), _buildCustomersTab()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddLeadDialog();
        },
        backgroundColor: const Color(0xFF3B82F6),
        child: const Icon(Icons.add),
      ),
    );
  }

  // LEADS TAB
  Widget _buildLeadsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Cards
          _buildLeadStats(),
          const SizedBox(height: 20),

          // Leads List
          _buildSectionHeader('Recent Leads', 'View All'),
          const SizedBox(height: 12),
          _buildLeadCard(
            name: 'John Doe',
            company: 'ABC Corp',
            phone: '+91 98765 43210',
            email: 'john@abc.com',
            source: 'Website',
            status: 'New',
            statusColor: const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 12),
          _buildLeadCard(
            name: 'Sarah Smith',
            company: 'XYZ Ltd',
            phone: '+91 98765 43211',
            email: 'sarah@xyz.com',
            source: 'Referral',
            status: 'Contacted',
            statusColor: const Color(0xFF10B981),
          ),
          const SizedBox(height: 12),
          _buildLeadCard(
            name: 'Mike Johnson',
            company: 'Tech Solutions',
            phone: '+91 98765 43212',
            email: 'mike@tech.com',
            source: 'LinkedIn',
            status: 'Qualified',
            statusColor: const Color(0xFF8B5CF6),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Total',
            '156',
            Icons.people,
            const Color(0xFF3B82F6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'New',
            '23',
            Icons.fiber_new,
            const Color(0xFF10B981),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Hot',
            '12',
            Icons.local_fire_department,
            const Color(0xFFEF4444),
          ),
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
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadCard({
    required String name,
    required String company,
    required String phone,
    required String email,
    required String source,
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
              CircleAvatar(
                backgroundColor: const Color(0xFF3B82F6).withOpacity(0.1),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 13,
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
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.phone, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text(
                phone,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.email, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text(
                email,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.source, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text(
                'Source: $source',
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, size: 16),
                  label: const Text('Call'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF3B82F6),
                    side: const BorderSide(color: Color(0xFF3B82F6)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showWhatsAppDialog(name);
                  },
                  icon: const Icon(Icons.message, size: 16),
                  label: const Text('WhatsApp'),
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
    );
  }

  // PIPELINE TAB
  Widget _buildPipelineTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pipeline Stages',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          _buildPipelineStage(
            stage: 'New Leads',
            count: 23,
            value: '₹12.5L',
            color: const Color(0xFF3B82F6),
            leads: ['John Doe - ABC Corp', 'Sarah Smith - XYZ Ltd'],
          ),
          const SizedBox(height: 12),
          _buildPipelineStage(
            stage: 'Contacted',
            count: 18,
            value: '₹18.2L',
            color: const Color(0xFF10B981),
            leads: [
              'Mike Johnson - Tech Solutions',
              'Emma Wilson - Digital Inc',
            ],
          ),
          const SizedBox(height: 12),
          _buildPipelineStage(
            stage: 'Proposal Sent',
            count: 12,
            value: '₹25.8L',
            color: const Color(0xFF8B5CF6),
            leads: ['David Brown - Cloud Systems'],
          ),
          const SizedBox(height: 12),
          _buildPipelineStage(
            stage: 'Negotiation',
            count: 8,
            value: '₹32.4L',
            color: const Color(0xFFF59E0B),
            leads: ['Lisa Anderson - Finance Pro'],
          ),
          const SizedBox(height: 12),
          _buildPipelineStage(
            stage: 'Won',
            count: 15,
            value: '₹45.6L',
            color: const Color(0xFF10B981),
            leads: ['Robert Taylor - Enterprise Ltd'],
          ),
        ],
      ),
    );
  }

  Widget _buildPipelineStage({
    required String stage,
    required int count,
    required String value,
    required Color color,
    required List<String> leads,
  }) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
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
                child: Text(
                  '$count leads',
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Total Value: $value',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3B82F6),
            ),
          ),
          const SizedBox(height: 12),
          ...leads.map(
            (lead) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: color),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      lead,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('View All')),
        ],
      ),
    );
  }

  // CUSTOMERS TAB
  Widget _buildCustomersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Auto Messaging Section
          _buildAutoMessagingCard(),
          const SizedBox(height: 20),

          // Customers List
          _buildSectionHeader('Active Customers', 'View All'),
          const SizedBox(height: 12),
          _buildCustomerCard(
            name: 'Robert Taylor',
            company: 'Enterprise Ltd',
            phone: '+91 98765 43213',
            email: 'robert@enterprise.com',
            lastContact: '2 days ago',
            totalValue: '₹15.2L',
            upcomingEvent: 'Birthday - Feb 15',
          ),
          const SizedBox(height: 12),
          _buildCustomerCard(
            name: 'Lisa Anderson',
            company: 'Finance Pro',
            phone: '+91 98765 43214',
            email: 'lisa@finance.com',
            lastContact: '5 days ago',
            totalValue: '₹8.5L',
            upcomingEvent: 'Anniversary - Feb 20',
          ),
        ],
      ),
    );
  }

  Widget _buildAutoMessagingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
              const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              const Text(
                'Auto Messaging',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAutoMessageItem('Birthday Wishes', '5 messages today'),
          const SizedBox(height: 8),
          _buildAutoMessageItem('Anniversary Greetings', '2 messages today'),
          const SizedBox(height: 8),
          _buildAutoMessageItem('Loan Sanction Dates', '3 upcoming'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              _showAutoMessageSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF3B82F6),
            ),
            child: const Text('Configure Messages'),
          ),
        ],
      ),
    );
  }

  Widget _buildAutoMessageItem(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const Icon(Icons.check_circle, color: Colors.white70, size: 20),
        ],
      ),
    );
  }

  Widget _buildCustomerCard({
    required String name,
    required String company,
    required String phone,
    required String email,
    required String lastContact,
    required String totalValue,
    required String upcomingEvent,
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
              CircleAvatar(
                backgroundColor: const Color(0xFF10B981).withOpacity(0.1),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Color(0xFF10B981),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                totalValue,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.event, size: 16, color: Color(0xFFF59E0B)),
                const SizedBox(width: 8),
                Text(
                  upcomingEvent,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF92400E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text(
                'Last contact: $lastContact',
                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        TextButton(onPressed: () {}, child: Text(action)),
      ],
    );
  }

  // DIALOGS

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Leads'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter name, company, or phone',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Leads'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
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
              title: const Text('New'),
              leading: Radio<String>(
                value: 'New',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() => _selectedFilter = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Hot'),
              leading: Radio<String>(
                value: 'Hot',
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

  void _showAddLeadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Lead'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Company',
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
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
                const SnackBar(content: Text('Lead added successfully!')),
              );
            },
            child: const Text('Add Lead'),
          ),
        ],
      ),
    );
  }

  void _showWhatsAppDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Send WhatsApp to $name'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.message, color: Color(0xFF10B981)),
              title: const Text('Send Template Message'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('WhatsApp message sent!')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Color(0xFF3B82F6)),
              title: const Text('Custom Message'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAutoMessageSettings() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Auto Message Settings'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: const Text('Birthday Wishes'),
                subtitle: const Text('Send automatic birthday greetings'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Anniversary Messages'),
                subtitle: const Text('Send anniversary greetings'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Loan Sanction Date'),
                subtitle: const Text('Remind on sanction anniversary'),
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
