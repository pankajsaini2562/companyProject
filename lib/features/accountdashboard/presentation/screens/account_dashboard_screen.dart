import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accountdashboard/presentation/widgets/money_kpi_card.dart';

class AccountsDashboardScreen extends StatelessWidget {
  const AccountsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('Accounts & Money'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _kpiGrid(),
            const SizedBox(height: 20),
            _chartCard(),
            const SizedBox(height: 20),
            _quickActions(context),
          ],
        ),
      ),
    );
  }

  Widget _kpiGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: const [
        MoneyKpiCard(
          title: 'Total Revenue',
          value: '₹24.6 L',
          icon: Icons.trending_up,
          color: Colors.green,
        ),
        MoneyKpiCard(
          title: 'Pending Dues',
          value: '₹3.8 L',
          icon: Icons.warning,
          color: Colors.red,
        ),
        MoneyKpiCard(
          title: 'Monthly GST',
          value: '₹1.2 L',
          icon: Icons.receipt_long,
          color: Colors.orange,
        ),
        MoneyKpiCard(
          title: 'Expenses',
          value: '₹6.4 L',
          icon: Icons.money_off,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _chartCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income vs Expense',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200, child: Placeholder()),
          ],
        ),
      ),
    );
  }

  Widget _quickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Access',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _navButton(context, 'Invoices', Icons.receipt),
            _navButton(context, 'Payments', Icons.payment),
            _navButton(context, 'Commission', Icons.percent),
            _navButton(context, 'GST Reports', Icons.description),
            _navButton(context, 'Expenses', Icons.money_off),
          ],
        ),
      ],
    );
  }

  Widget _navButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
