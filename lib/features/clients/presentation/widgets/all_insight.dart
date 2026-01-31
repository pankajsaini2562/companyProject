import 'package:flutter/material.dart';

class AIInsights extends StatelessWidget {
  const AIInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF524774), // purple background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          /// Title
          Text(
            'AI Insights',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          _InsightBullet(text: 'Most traffic comes from Facebook Ads.'),
          _InsightBullet(
            text:
                '20% leads turn into cold leads, because of unsatisfactory response (according to feedback).',
          ),
          _InsightBullet(
            text:
                '75% of the clients implied that the confirmation hours are more than they should be.',
          ),
          _InsightBullet(
            text: 'Meta Ads have improved 12% over the last week.',
          ),
          _InsightBullet(
            text:
                'Enhancement suggestions from customers - manage finance, and splitting (25%).',
          ),
          _InsightBullet(text: 'Site traffic has increased by 17.25%.'),
        ],
      ),
    );
  }
}

/// Bullet row widget
class _InsightBullet extends StatelessWidget {
  final String text;

  const _InsightBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: Colors.white, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
