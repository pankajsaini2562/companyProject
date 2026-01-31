import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/ai_insight_card.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/lead_radical_chart.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/local_stats_summary.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/upcoming_task_card.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              child: SvgPicture.asset(
                'assets/icons/Ellipse_1.svg',
                width: 36,
                height: 36,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: const [
            DashboardCards(),
            UpcomingTasksCard(),
            LoanStatsSummary(),
            LeadsRadialChart(),
            AiInsightsCard(),
          ],
        ),
      ),
    );
  }
}
