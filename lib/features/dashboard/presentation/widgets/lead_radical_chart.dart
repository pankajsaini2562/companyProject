import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LeadsRadialChart extends StatefulWidget {
  const LeadsRadialChart({super.key});

  @override
  State<LeadsRadialChart> createState() => _LeadsRadialChartState();
}

class _LeadsRadialChartState extends State<LeadsRadialChart> {
  final double referrals = 70;
  final double metaAds = 55;
  final double instagram = 45;
  final double facebook = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 🔑 important
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Leads from different\nSources',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: SizedBox(
              height: 280, // 🔑 fixed size
              width: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildRing(referrals, Colors.deepPurple, 26),
                  _buildRing(metaAds, Colors.blue, 20),
                  _buildRing(instagram, Colors.orange, 14),
                  _buildRing(facebook, Colors.green, 8),

                  const Text(
                    '2025',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRing(double value, Color color, double thickness) {
    return PieChart(
      PieChartData(
        startDegreeOffset: -90,
        sectionsSpace: 0,
        centerSpaceRadius: 70,
        sections: [
          PieChartSectionData(
            value: value,
            color: color,
            radius: thickness,
            showTitle: false,
          ),
          PieChartSectionData(
            value: 100 - value,
            color: color.withOpacity(0.15),
            radius: thickness,
            showTitle: false,
          ),
        ],
      ),
    );
  }
}
