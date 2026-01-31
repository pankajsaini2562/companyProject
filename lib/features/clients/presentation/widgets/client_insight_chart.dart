import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ClientInsightChart extends StatelessWidget {
  const ClientInsightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Client Insights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Loan Type vs CIBIL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),

            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, interval: 25),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const loanTypes = [
                            'Personal Loan',
                            'Business Loan',
                            'Home Loan',
                          ];
                          if (value.toInt() >= 0 &&
                              value.toInt() < loanTypes.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                loanTypes[value.toInt()],
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                        reservedSize: 60,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: true, horizontalInterval: 25),
                  borderData: FlBorderData(show: false),

                  barGroups: [
                    // Personal Loan bars
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 65, // 2025 value
                          color: Colors.purple,
                          width: 12,
                        ),
                        BarChartRodData(
                          toY: 40, // 2024 value
                          color: Colors.orange,
                          width: 12,
                        ),
                      ],
                      barsSpace: 6,
                    ),

                    // Business Loan bars
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 75, // 2025 value
                          color: Colors.purple,
                          width: 12,
                        ),
                        BarChartRodData(
                          toY: 50, // 2024 value
                          color: Colors.orange,
                          width: 12,
                        ),
                      ],
                      barsSpace: 6,
                    ),

                    // Home Loan bars
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 45, // 2025 value
                          color: Colors.purple,
                          width: 12,
                        ),
                        BarChartRodData(
                          toY: 30, // 2024 value
                          color: Colors.orange,
                          width: 12,
                        ),
                      ],
                      barsSpace: 6,
                    ),
                  ],

                  groupsSpace: 30,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.purple, '2025'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.orange, '2024'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(width: 14, height: 14, color: color),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
