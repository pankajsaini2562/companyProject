import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';

class ReportsAnalyticsScreen extends StatefulWidget {
  const ReportsAnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsAnalyticsScreen> createState() => _ReportsAnalyticsScreenState();
}

class _ReportsAnalyticsScreenState extends State<ReportsAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPeriod = 'This Month';

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
          'Reports & Analytics',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Color(0xFF64748B)),
            onPressed: () {
              _showExportDialog();
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Color(0xFF64748B)),
            onPressed: () {
              _showPeriodSelector();
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
            Tab(text: 'GST Reports'),
            Tab(text: 'Commission Reports'),
            Tab(text: 'Product Analytics'),
            Tab(text: 'Live Dashboard'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGSTReportsTab(),
          _buildCommissionReportsTab(),
          _buildProductAnalyticsTab(),
          _buildLiveDashboardTab(),
        ],
      ),
    );
  }

  // GST REPORTS TAB (Feature #15)
  Widget _buildGSTReportsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Auto GST Report Status
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF059669)],
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Auto GST Reports',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Monthly automated generation',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: Color(0xFF10B981),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Active',
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // GST Summary Cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total GST',
                  '₹2.45L',
                  Icons.currency_rupee,
                  const Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'CGST',
                  '₹1.22L',
                  Icons.splitscreen,
                  const Color(0xFF10B981),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'SGST',
                  '₹1.23L',
                  Icons.splitscreen,
                  const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Monthly GST Reports
          const Text(
            'Monthly GST Reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildGSTReportCard(
            month: 'February 2024',
            gstAmount: '₹2,45,350',
            status: 'Generated',
            statusColor: const Color(0xFF10B981),
            filedDate: '2024-02-05',
          ),
          const SizedBox(height: 12),
          _buildGSTReportCard(
            month: 'January 2024',
            gstAmount: '₹2,18,420',
            status: 'Filed',
            statusColor: const Color(0xFF3B82F6),
            filedDate: '2024-01-10',
          ),
          const SizedBox(height: 12),
          _buildGSTReportCard(
            month: 'December 2023',
            gstAmount: '₹2,89,670',
            status: 'Filed',
            statusColor: const Color(0xFF3B82F6),
            filedDate: '2023-12-12',
          ),
        ],
      ),
    );
  }

  Widget _buildGSTReportCard({
    required String month,
    required String gstAmount,
    required String status,
    required Color statusColor,
    required String filedDate,
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
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.description,
                  color: Color(0xFF10B981),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'GST: $gstAmount',
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
              const Icon(
                Icons.calendar_today,
                size: 14,
                color: Color(0xFF64748B),
              ),
              const SizedBox(width: 4),
              Text(
                'Filed: $filedDate',
                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  _downloadReport('GST', month);
                },
                icon: const Icon(Icons.download, size: 16),
                label: const Text('Download'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // COMMISSION REPORTS TAB (Feature #16)
  Widget _buildCommissionReportsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Commission Overview
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.payments, color: Colors.white, size: 32),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Partner Commission Reports',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Track partner earnings',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildWhiteStatCard('Total Paid', '₹15.2L'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: _buildWhiteStatCard('Pending', '₹3.8L')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Top Partners
          const Text(
            'Top Performing Partners',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildCommissionCard(
            partnerName: 'ABC Finance Partners',
            deals: 45,
            commission: '₹4,52,000',
            status: 'Paid',
            statusColor: const Color(0xFF10B981),
            rank: 1,
          ),
          const SizedBox(height: 12),
          _buildCommissionCard(
            partnerName: 'XYZ Loan Associates',
            deals: 38,
            commission: '₹3,85,200',
            status: 'Paid',
            statusColor: const Color(0xFF10B981),
            rank: 2,
          ),
          const SizedBox(height: 12),
          _buildCommissionCard(
            partnerName: 'DEF Consultants',
            deals: 32,
            commission: '₹3,24,800',
            status: 'Pending',
            statusColor: const Color(0xFFF59E0B),
            rank: 3,
          ),
          const SizedBox(height: 12),
          _buildCommissionCard(
            partnerName: 'GHI Finance Hub',
            deals: 28,
            commission: '₹2,89,600',
            status: 'Paid',
            statusColor: const Color(0xFF10B981),
            rank: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildCommissionCard({
    required String partnerName,
    required int deals,
    required String commission,
    required String status,
    required Color statusColor,
    required int rank,
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '#$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partnerName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.trending_up,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$deals deals',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      commission,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    );
  }

  // PRODUCT ANALYTICS TAB (Features #20, #21)
  Widget _buildProductAnalyticsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // High Selling Product Indicator (Feature #20)
          const Text(
            'High Selling Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildProductCard(
            productName: 'Personal Loan - Quick',
            sales: 156,
            revenue: '₹45.2L',
            growth: '+24%',
            isHighSelling: true,
            color: const Color(0xFF10B981),
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 12),
          _buildProductCard(
            productName: 'Business Loan - Premium',
            sales: 89,
            revenue: '₹32.8L',
            growth: '+18%',
            isHighSelling: true,
            color: const Color(0xFF10B981),
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 12),
          _buildProductCard(
            productName: 'Home Loan - Standard',
            sales: 67,
            revenue: '₹28.5L',
            growth: '+12%',
            isHighSelling: true,
            color: const Color(0xFF10B981),
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 24),

          // High Error Product Indicator (Feature #21)
          const Text(
            'High Error Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildProductCard(
            productName: 'Business Loan - Standard',
            sales: 45,
            revenue: '₹12.4L',
            growth: '-8%',
            isHighSelling: false,
            color: const Color(0xFFEF4444),
            icon: Icons.error_outline,
            errorRate: '18%',
          ),
          const SizedBox(height: 12),
          _buildProductCard(
            productName: 'Vehicle Loan - Express',
            sales: 38,
            revenue: '₹9.8L',
            growth: '-5%',
            isHighSelling: false,
            color: const Color(0xFFEF4444),
            icon: Icons.error_outline,
            errorRate: '15%',
          ),
          const SizedBox(height: 24),

          // Product Performance Chart
          const Text(
            'Product Performance Trend',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildProductChart(),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String productName,
    required int sales,
    required String revenue,
    required String growth,
    required bool isHighSelling,
    required Color color,
    required IconData icon,
    String? errorRate,
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
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '$sales sales',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          revenue,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF10B981),
                          ),
                        ),
                      ],
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
                    Icon(
                      isHighSelling ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 12,
                      color: color,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      growth,
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
          if (errorRate != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, size: 16, color: Color(0xFFEF4444)),
                  const SizedBox(width: 8),
                  Text(
                    'Error Rate: $errorRate - Requires attention',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF991B1B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProductChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 250,
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
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: const Color(0xFFE2E8F0), strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                  if (value.toInt() >= 0 && value.toInt() < titles.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        titles[value.toInt()],
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 11,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 11,
                    ),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 45),
                const FlSpot(1, 52),
                const FlSpot(2, 48),
                const FlSpot(3, 65),
                const FlSpot(4, 58),
                const FlSpot(5, 72),
              ],
              isCurved: true,
              color: const Color(0xFF10B981),
              barWidth: 3,
              dotData: FlDotData(show: true),
            ),
            LineChartBarData(
              spots: [
                const FlSpot(0, 32),
                const FlSpot(1, 28),
                const FlSpot(2, 35),
                const FlSpot(3, 30),
                const FlSpot(4, 25),
                const FlSpot(5, 22),
              ],
              isCurved: true,
              color: const Color(0xFFEF4444),
              barWidth: 3,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  // LIVE DASHBOARD TAB (Feature #12 - Live Excel & Dashboard report)
  Widget _buildLiveDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Status Indicator
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF10B981)),
            ),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Live Dashboard - Auto-updating',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10B981),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Last updated: Just now',
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Key Metrics
          const Text(
            'Key Performance Indicators',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Revenue',
                  '₹125.8L',
                  Icons.attach_money,
                  const Color(0xFF10B981),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Active Deals',
                  '245',
                  Icons.handshake,
                  const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Conversion Rate',
                  '68%',
                  Icons.trending_up,
                  const Color(0xFF8B5CF6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Avg Processing',
                  '3.2 days',
                  Icons.timer,
                  const Color(0xFFF59E0B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Excel Export Options
          const Text(
            'Excel Reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          _buildExcelExportCard(
            'Complete Dashboard Report',
            'All KPIs and metrics',
            Icons.dashboard,
            const Color(0xFF10B981),
          ),
          const SizedBox(height: 12),
          _buildExcelExportCard(
            'Sales Performance',
            'Detailed sales analytics',
            Icons.show_chart,
            const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 12),
          _buildExcelExportCard(
            'Financial Summary',
            'Revenue and commission data',
            Icons.account_balance_wallet,
            const Color(0xFF8B5CF6),
          ),
        ],
      ),
    );
  }

  Widget _buildExcelExportCard(
    String title,
    String subtitle,
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
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _downloadExcelReport(title);
            },
            icon: const Icon(Icons.download, size: 16),
            label: const Text('Export'),
            style: ElevatedButton.styleFrom(backgroundColor: color),
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
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  // DIALOGS

  void _showPeriodSelector() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Period'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('This Month'),
              leading: Radio<String>(
                value: 'This Month',
                groupValue: _selectedPeriod,
                onChanged: (value) {
                  setState(() => _selectedPeriod = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Last Month'),
              leading: Radio<String>(
                value: 'Last Month',
                groupValue: _selectedPeriod,
                onChanged: (value) {
                  setState(() => _selectedPeriod = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Last 3 Months'),
              leading: Radio<String>(
                value: 'Last 3 Months',
                groupValue: _selectedPeriod,
                onChanged: (value) {
                  setState(() => _selectedPeriod = value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Custom Range'),
              leading: Radio<String>(
                value: 'Custom Range',
                groupValue: _selectedPeriod,
                onChanged: (value) {
                  setState(() => _selectedPeriod = value!);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Report'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.table_chart, color: Color(0xFF10B981)),
              title: const Text('Export as Excel'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting to Excel...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Color(0xFFEF4444),
              ),
              title: const Text('Export as PDF'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting to PDF...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.code, color: Color(0xFF3B82F6)),
              title: const Text('Export as CSV'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting to CSV...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _downloadReport(String type, String month) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloading $type report for $month...')),
    );
  }

  void _downloadExcelReport(String reportName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloading $reportName Excel report...')),
    );
  }
}
