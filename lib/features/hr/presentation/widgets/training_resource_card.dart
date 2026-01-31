import 'package:flutter/material.dart';

class TrainingResourcesCard extends StatelessWidget {
  const TrainingResourcesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: width, // full screen width
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.school, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Training Resources",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _resourceTile(
                  backgroundColor: Color(0xFFE6F4F8),
                  title: "SOP Training Module",
                  subtitle: "AI generated MCQ tests",
                  actionText: "Start Tests →",
                  actionColor: Colors.blue,
                ),

                const SizedBox(height: 12),

                _resourceTile(
                  backgroundColor: Color(0xFFEAF7EA),
                  title: "Video Tutorials",
                  subtitle: "YouTube training series",
                  actionText: "Watch Videos →",
                  actionColor: Colors.green,
                ),

                const SizedBox(height: 12),

                _resourceTile(
                  backgroundColor: Color(0xFFFFEFE6),
                  title: "Document Library",
                  subtitle: "Reference Materials",
                  actionText: "Browse Files →",
                  actionColor: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resourceTile({
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required String actionText,
    required Color actionColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Text(
            actionText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: actionColor,
            ),
          ),
        ],
      ),
    );
  }
}
