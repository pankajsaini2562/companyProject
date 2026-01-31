import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_crm/features/chat/presentation/widgets/lead_screen.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/line_chart_widget.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/status_card.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/user_info_card.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class NewLeadScreen extends StatefulWidget {
  const NewLeadScreen({super.key});

  @override
  State<NewLeadScreen> createState() => _NewLeadScreenState();
}

class _NewLeadScreenState extends State<NewLeadScreen> {
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
                'assets/icons/Ellipse_1.svg', // rename recommended
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Leads and\nPipelines',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Conversion Rate',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(19),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barTouchData: BarTouchData(enabled: false),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: false),

                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return const Text('Hot');
                                    case 1:
                                      return const Text('Warm');
                                    case 2:
                                      return const Text('Cold');
                                    default:
                                      return const SizedBox();
                                  }
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),

                          barGroups: [
                            _barGroup(0, 57.79, Colors.red),
                            _barGroup(1, 70.73, Colors.green),
                            _barGroup(2, 37.48, Colors.blue),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.square,
                            size: 10,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(width: 4),
                          Text('2025'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Text(
                      'Recent Leads',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UserInfoCard(
                      initials: 'Rk',
                      name: 'Rakesh Kumar',
                      source: 'Meta Ads',
                      category: 'Loan approval',
                      time: "23 hrs ago",
                      score: 86,
                    ),

                    const SizedBox(height: 5),
                    UserInfoCard(
                      initials: 'Rk',
                      name: 'Rakesh Kumar',
                      source: 'Meta Ads',
                      category: 'Loan approval',
                      time: "23 hrs ago",
                      score: 86,
                    ),
                    const SizedBox(height: 5),
                    UserInfoCard(
                      initials: 'Rk',
                      name: 'Rakesh Kumar',
                      source: 'Meta Ads',
                      category: 'Loan approval',
                      time: "23 hrs ago",
                      score: 86,
                    ),

                    const SizedBox(height: 5),
                    UserInfoCard(
                      initials: 'Rk',
                      name: 'Rakesh Kumar',
                      source: 'Meta Ads',
                      category: 'Loan approval',
                      time: "23 hrs ago",
                      score: 86,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LeadsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue, // optional for link feel
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Lifetime Value \n Analysis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                        fontSize: 19,
                      ),
                    ),

                    const SizedBox(height: 5),
                    Center(child: LineChartWidget()),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Text(
                      'Pipeline View',

                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          StatusCard(
                            title: "NEW",
                            count: 10,
                            color: Color(0xFFD9F1FA),
                          ),
                          StatusCard(
                            title: "Processing",
                            count: 17,
                            color: Color(0xFFDFF4DD),
                          ),
                          StatusCard(
                            title: "Accepted",
                            count: 13,
                            color: Color(0xFFE4E1FF),
                          ),
                          StatusCard(
                            title: "Rejected",
                            count: 8,
                            color: Color(0xFFFFE1E1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF448D44),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WhatsApp Integration',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Color(0x4D6DC16D),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Response',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 12),
                              Text(
                                '12 unread message',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Response',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 12),
                              Text(
                                '12 unread message',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        // open whatsapp logic
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            'Open WhatsApp',
                            style: TextStyle(
                              color: Color(0xFF3E8E41),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData _barGroup(int x, double value, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 18,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
