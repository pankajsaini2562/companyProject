import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_crm/features/accounts/presentation/widgets/accounting_report.dart';
import 'package:mobile_crm/features/accounts/presentation/widgets/financial_kpi_card.dart';
import 'package:mobile_crm/features/accounts/presentation/widgets/new_invoice.dart';
import 'package:mobile_crm/features/accounts/presentation/widgets/quick_actions_card.dart';
import 'package:mobile_crm/features/accounts/presentation/widgets/recent_invoice.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B1D4F),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                'assets/icons/ellipse_1.svg', // rename recommended
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              AccountingReports(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InvoiceScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.blueAccent),
                  label: const Text("New Invoice"),
                ),
              ),
              QuickActionsCard(),
              RecentInvoicesUI(),
              FinancialKpiCard(),
            ],
          ),
        ),
      ),
    );
  }
}
