import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_crm/features/clients/presentation/widgets/all_insight.dart';
import 'package:mobile_crm/features/clients/presentation/widgets/client_deedback.dart';
import 'package:mobile_crm/features/clients/presentation/widgets/client_insight_chart.dart';
import 'package:mobile_crm/features/clients/presentation/widgets/client_insights_chart.dart'
    show ClientInsightsChart;
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class Client extends StatefulWidget {
  const Client({super.key});

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
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
              backgroundColor: Colors.grey.shade300,
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
              Container(
                child: Column(
                  children: [
                    ClientInsightChart(),
                    ClientInsightsChart(),
                    const ClientFeedback(),
                    AIInsights(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
