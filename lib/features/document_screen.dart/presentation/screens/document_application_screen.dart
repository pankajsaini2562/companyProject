import 'package:flutter/material.dart';
import 'dart:io';

import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

class DocumentsApplicationsScreen extends StatefulWidget {
  const DocumentsApplicationsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsApplicationsScreen> createState() =>
      _DocumentsApplicationsScreenState();
}

class _DocumentsApplicationsScreenState
    extends State<DocumentsApplicationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
      drawer: const AppDrawer(),
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
          'Documents & Applications',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
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
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF3B82F6),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF3B82F6),
          tabs: const [
            Tab(text: 'Applications'),
            Tab(text: 'Documents'),
            Tab(text: 'Downloads'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildApplicationsTab(),
          _buildDocumentsTab(),
          _buildDownloadsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showNewApplicationDialog();
        },
        backgroundColor: const Color(0xFF3B82F6),
        icon: const Icon(Icons.add),
        label: const Text('New Application'),
      ),
    );
  }

  // APPLICATIONS TAB (Feature #1)
  Widget _buildApplicationsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total',
                  '156',
                  Icons.description,
                  const Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Pending',
                  '23',
                  Icons.pending,
                  const Color(0xFFF59E0B),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Approved',
                  '120',
                  Icons.check_circle,
                  const Color(0xFF10B981),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Applications List
          const Text(
            'Recent Applications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildApplicationCard(
            applicantName: 'John Doe',
            applicationType: 'Loan Application',
            applicationId: 'APP001234',
            submittedDate: '2024-02-05',
            status: 'Pending Review',
            statusColor: const Color(0xFFF59E0B),
            documentsCount: 8,
          ),
          const SizedBox(height: 12),
          _buildApplicationCard(
            applicantName: 'Sarah Smith',
            applicationType: 'Business Loan',
            applicationId: 'APP001235',
            submittedDate: '2024-02-04',
            status: 'Documents Required',
            statusColor: const Color(0xFFEF4444),
            documentsCount: 5,
          ),
          const SizedBox(height: 12),
          _buildApplicationCard(
            applicantName: 'Mike Johnson',
            applicationType: 'Personal Loan',
            applicationId: 'APP001236',
            submittedDate: '2024-02-03',
            status: 'Approved',
            statusColor: const Color(0xFF10B981),
            documentsCount: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationCard({
    required String applicantName,
    required String applicationType,
    required String applicationId,
    required String submittedDate,
    required String status,
    required Color statusColor,
    required int documentsCount,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicantName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      applicationType,
                      style: const TextStyle(
                        fontSize: 14,
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
              const Icon(Icons.badge, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text(
                applicationId,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_today,
                size: 16,
                color: Color(0xFF64748B),
              ),
              const SizedBox(width: 6),
              Text(
                submittedDate,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.folder, size: 16, color: Color(0xFF3B82F6)),
              const SizedBox(width: 6),
              Text(
                '$documentsCount documents attached',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF3B82F6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showApplicationDetails(applicantName, applicationId);
                  },
                  icon: const Icon(Icons.visibility, size: 16),
                  label: const Text('View'),
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
                    _showDocumentsList(applicantName);
                  },
                  icon: const Icon(Icons.description, size: 16),
                  label: const Text('Documents'),
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

  // DOCUMENTS TAB (Feature #2, #8)
  Widget _buildDocumentsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upload Section
          _buildUploadSection(),
          const SizedBox(height: 20),

          // Blurry Documents Finder (Feature #8)
          _buildBlurryDocumentsFinder(),
          const SizedBox(height: 20),

          // Document Categories
          const Text(
            'Document Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildDocumentCategoryCard(
            category: 'CIBIL Reports',
            icon: Icons.assessment,
            color: const Color(0xFF3B82F6),
            count: 45,
            description: 'Credit reports and scores',
          ),
          const SizedBox(height: 12),
          _buildDocumentCategoryCard(
            category: 'ITR Documents',
            icon: Icons.receipt_long,
            color: const Color(0xFF10B981),
            count: 32,
            description: 'Income tax returns',
          ),
          const SizedBox(height: 12),
          _buildDocumentCategoryCard(
            category: 'Banking Documents',
            icon: Icons.account_balance,
            color: const Color(0xFF8B5CF6),
            count: 28,
            description: 'Bank statements and certificates',
          ),
          const SizedBox(height: 12),
          _buildDocumentCategoryCard(
            category: 'GST Certificates',
            icon: Icons.verified,
            color: const Color(0xFFF59E0B),
            count: 18,
            description: 'GST registration certificates',
          ),
          const SizedBox(height: 12),
          _buildDocumentCategoryCard(
            category: 'GST Returns',
            icon: Icons.file_present,
            color: const Color(0xFFEF4444),
            count: 56,
            description: 'Monthly GST returns',
          ),
        ],
      ),
    );
  }

  Widget _buildUploadSection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        children: [
          const Icon(Icons.cloud_upload, color: Colors.white, size: 48),
          const SizedBox(height: 12),
          const Text(
            'Upload Documents',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Drag and drop or click to upload',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showUploadDialog();
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Choose Files'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3B82F6),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showCameraDialog();
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take Photo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3B82F6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBlurryDocumentsFinder() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEF4444), width: 2),
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
                  color: const Color(0xFFEF4444).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.warning_amber,
                  color: Color(0xFFEF4444),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blurry Documents Finder',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'Auto-detect unclear documents',
                      style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Color(0xFFEF4444),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    '3 blurry documents detected',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF991B1B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              _showBlurryDocumentsList();
            },
            icon: const Icon(Icons.search, size: 18),
            label: const Text('View Blurry Documents'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              minimumSize: const Size(double.infinity, 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCategoryCard({
    required String category,
    required IconData icon,
    required Color color,
    required int count,
    required String description,
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
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$count documents',
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _showCategoryDocuments(category);
            },
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            color: const Color(0xFF64748B),
          ),
        ],
      ),
    );
  }

  // DOWNLOADS TAB (Features #3, #4, #5, #6, #7)
  Widget _buildDownloadsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Available Downloads',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),

          // CIBIL Report (Feature #3)
          _buildDownloadCard(
            title: 'CIBIL Report',
            subtitle: 'Download credit reports',
            icon: Icons.assessment,
            color: const Color(0xFF3B82F6),
            downloadCount: 45,
          ),
          const SizedBox(height: 12),

          // ITR Download (Feature #4)
          _buildDownloadCard(
            title: 'ITR Download',
            subtitle: 'Income Tax Returns',
            icon: Icons.receipt_long,
            color: const Color(0xFF10B981),
            downloadCount: 32,
          ),
          const SizedBox(height: 12),

          // Banking Download (Feature #5)
          _buildDownloadCard(
            title: 'Banking Download',
            subtitle: 'Bank statements & documents',
            icon: Icons.account_balance,
            color: const Color(0xFF8B5CF6),
            downloadCount: 28,
          ),
          const SizedBox(height: 12),

          // GST Certificate Download (Feature #6)
          _buildDownloadCard(
            title: 'GST Certificate Download',
            subtitle: 'GST registration certificates',
            icon: Icons.verified,
            color: const Color(0xFFF59E0B),
            downloadCount: 18,
          ),
          const SizedBox(height: 12),

          // GST Returns Download (Feature #7)
          _buildDownloadCard(
            title: 'GST Returns Download',
            subtitle: 'Monthly GST returns',
            icon: Icons.file_present,
            color: const Color(0xFFEF4444),
            downloadCount: 56,
          ),
          const SizedBox(height: 20),

          // Recent Downloads
          const Text(
            'Recent Downloads',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildRecentDownloadItem(
            'CIBIL_Report_John_Doe.pdf',
            '2.5 MB',
            '2024-02-07 10:30 AM',
            const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 8),
          _buildRecentDownloadItem(
            'ITR_2023_Sarah_Smith.pdf',
            '1.8 MB',
            '2024-02-07 09:15 AM',
            const Color(0xFF10B981),
          ),
          const SizedBox(height: 8),
          _buildRecentDownloadItem(
            'Bank_Statement_Jan_2024.pdf',
            '3.2 MB',
            '2024-02-06 04:20 PM',
            const Color(0xFF8B5CF6),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required int downloadCount,
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$downloadCount available',
                  style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _showDownloadOptions(title);
            },
            icon: const Icon(Icons.download, size: 16),
            label: const Text('Download'),
            style: ElevatedButton.styleFrom(backgroundColor: color),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentDownloadItem(
    String filename,
    String size,
    String date,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.picture_as_pdf, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filename,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '$size • $date',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 18),
            color: const Color(0xFF64748B),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
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
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  // DIALOGS

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Documents'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter application ID or name',
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

  void _showNewApplicationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Application'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Applicant Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Application Type',
                  prefixIcon: Icon(Icons.category),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'loan',
                    child: Text('Loan Application'),
                  ),
                  DropdownMenuItem(
                    value: 'business',
                    child: Text('Business Loan'),
                  ),
                  DropdownMenuItem(
                    value: 'personal',
                    child: Text('Personal Loan'),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
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
                const SnackBar(content: Text('Application created!')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showApplicationDetails(String name, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Application Details - $id'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Applicant: $name'),
              const SizedBox(height: 8),
              const Text('Status: Pending Review'),
              const SizedBox(height: 8),
              const Text('Submitted: 2024-02-05'),
              const SizedBox(height: 8),
              const Text('Documents: 8 files'),
            ],
          ),
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

  void _showDocumentsList(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Documents - $name'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.picture_as_pdf,
                  color: Color(0xFFEF4444),
                ),
                title: const Text('CIBIL Report'),
                subtitle: const Text('2.5 MB'),
                trailing: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {},
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.picture_as_pdf,
                  color: Color(0xFF10B981),
                ),
                title: const Text('ITR 2023'),
                subtitle: const Text('1.8 MB'),
                trailing: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {},
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.picture_as_pdf,
                  color: Color(0xFF3B82F6),
                ),
                title: const Text('Bank Statement'),
                subtitle: const Text('3.2 MB'),
                trailing: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {},
                ),
              ),
            ],
          ),
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

  void _showUploadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Upload Documents'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.folder, color: Color(0xFF3B82F6)),
              title: const Text('From Files'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening file picker...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud, color: Color(0xFF10B981)),
              title: const Text('From Cloud'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCameraDialog() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Opening camera...')));
  }

  void _showBlurryDocumentsList() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Blurry Documents'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.warning,
                    color: Color(0xFFEF4444),
                    size: 20,
                  ),
                ),
                title: const Text('PAN_Card_Blur.jpg'),
                subtitle: const Text('Quality: 35% - Needs re-upload'),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {},
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.warning,
                    color: Color(0xFFEF4444),
                    size: 20,
                  ),
                ),
                title: const Text('Aadhar_Back_Blur.jpg'),
                subtitle: const Text('Quality: 42% - Needs re-upload'),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {},
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.warning,
                    color: Color(0xFFEF4444),
                    size: 20,
                  ),
                ),
                title: const Text('Bank_Statement_Blur.pdf'),
                subtitle: const Text('Quality: 38% - Needs re-upload'),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {},
                ),
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
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Re-upload request sent!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
            ),
            child: const Text('Request Re-upload'),
          ),
        ],
      ),
    );
  }

  void _showCategoryDocuments(String category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(category),
        content: const Text('Showing documents in this category...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDownloadOptions(String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download $title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.download, color: Color(0xFF3B82F6)),
              title: const Text('Download All'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Downloading all $title...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter_list, color: Color(0xFF10B981)),
              title: const Text('Select Specific Files'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
