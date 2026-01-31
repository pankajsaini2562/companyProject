import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ClientFeedback extends StatelessWidget {
  const ClientFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            const Text(
              'Client Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            /// Chart + legend
            Row(
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          centerSpaceRadius: 45,
                          sectionsSpace: 2,
                          sections: _sections,
                        ),
                      ),
                      const Text(
                        '73%\nPositive',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                /// Legend
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LegendItem(
                      color: Color(0xFF4B3F72),
                      label: 'Positive',
                      value: '73',
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: Color(0xFF6FCF97),
                      label: 'Neutral',
                      value: '12',
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: Color(0xFFF2994A),
                      label: 'Negative',
                      value: '15',
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Feedback message
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 16,
                    child: Icon(Icons.person, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The loan process was smooth and transparent. '
                          'The documentation requirements were clearly explained, '
                          'and I received approval within 48 hours.',
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: List.generate(
                            4,
                            (_) => const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                          )..add(const Icon(Icons.star_border, size: 16)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pie chart sections
final List<PieChartSectionData> _sections = [
  PieChartSectionData(value: 73, color: Color(0xFF4B3F72), showTitle: false),
  PieChartSectionData(value: 12, color: Color(0xFF6FCF97), showTitle: false),
  PieChartSectionData(value: 15, color: Color(0xFFF2994A), showTitle: false),
];

/// Legend item
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text('$label $value', style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
