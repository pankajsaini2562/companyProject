import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ClientInsightsChart extends StatelessWidget {
  const ClientInsightsChart({Key? key}) : super(key: key);

  final List<FlSpot> lastWeekSpots = const [
    FlSpot(0, 50),
    FlSpot(1, 60),
    FlSpot(2, 75),
    FlSpot(3, 75),
    FlSpot(4, 75),
    FlSpot(5, 50),
    FlSpot(6, 50),
  ];

  final List<FlSpot> presentSpots = const [
    FlSpot(0, 70),
    FlSpot(1, 75),
    FlSpot(2, 75),
    FlSpot(3, 75),
    FlSpot(4, 75),
    FlSpot(5, 50),
    FlSpot(6, 95),
  ];

  final List<String> labels = const [
    'Figma',
    'Sketch',
    'XD',
    'PS',
    'AI',
    'ConID RAW',
    'InDes ign',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Application and Communication Insights',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        // First Chart
        Text(
          'Last week',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 200,
          child: LineChart(_lineChartData(lastWeekSpots, Colors.blue.shade300)),
        ),

        const SizedBox(height: 32),

        // Second Chart
        Text(
          'Present',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 200,
          child: LineChart(_lineChartData(presentSpots, Colors.green.shade300)),
        ),

        const SizedBox(height: 8),

        // Labels for second chart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels
              .map(
                (label) => Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 32),

        // Footer stats
        const Text(
          'Response Time to Messages: 2-3 hrs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Avg Logins: 47'),
            Text('Avg response time from the customer: 1.8'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text('Week: 9'), Text(' from the customer: 1.8')],
        ),
      ],
    );
  }

  LineChartData _lineChartData(List<FlSpot> spots, Color fillColor) {
    return LineChartData(
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 100,
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 25,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 10),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 25,
        drawVerticalLine: false,
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: fillColor.darken(0.2),
          barWidth: 3,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: fillColor.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

// Extension for color darkening
extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
