import 'package:flutter/material.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C1E6E),
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Leads",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // Filters + Button Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _chip("All", selected: true),
                _chip("Hot"),
                _chip("Warm"),
                _chip("Cold"),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3C1E6E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Add new\nlead",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Lead List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _leadCard(
                  name: "Rakesh Kumar",
                  initials: "RK",
                  score: "92",
                  source: "Facebook | Docs Collection",
                  time: "2 hrs ago",
                  bg: const Color(0xFFFFE3D6),
                ),
                _leadCard(
                  name: "Priya Sharma",
                  initials: "PS",
                  score: "45",
                  source: "Referral | Application Drop",
                  time: "3 hrs ago",
                  bg: const Color(0xFFE8F4FF),
                ),
                _leadCard(
                  name: "Amit Patel",
                  initials: "AP",
                  score: "68",
                  source: "Facebook | Initial Contact",
                  time: "2 hrs ago",
                  bg: const Color(0xFFE9F6EA),
                ),
                _leadCard(
                  name: "Nikita Khattar",
                  initials: "NK",
                  score: "86",
                  source: "Meta Ads | Loan approval",
                  time: "23 hrs ago",
                  bg: const Color(0xFFFFE6E0),
                  highlight: true,
                ),
                _leadCard(
                  name: "Priya Sharma",
                  initials: "PS",
                  score: "45",
                  source: "Referral | Application Drop",
                  time: "3 hrs ago",
                  bg: const Color(0xFFE8F4FF),
                ),
                _leadCard(
                  name: "Rakesh Kumar",
                  initials: "RK",
                  score: "92",
                  source: "Facebook | Docs Collection",
                  time: "2 hrs ago",
                  bg: const Color(0xFFFFE3D6),
                ),
                _leadCard(
                  name: "Amit Patel",
                  initials: "AP",
                  score: "68",
                  source: "Facebook | Initial Contact",
                  time: "2 hrs ago",
                  bg: const Color(0xFFE9F6EA),
                ),
                _leadCard(
                  name: "Nikita Khattar",
                  initials: "NK",
                  score: "86",
                  source: "Meta Ads | Loan approval",
                  time: "23 hrs ago",
                  bg: const Color(0xFFFFE6E0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Chip Widget
  Widget _chip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD9D2FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: const TextStyle(fontSize: 13)),
      ),
    );
  }

  // Lead Card Widget
  Widget _leadCard({
    required String name,
    required String initials,
    required String score,
    required String source,
    required String time,
    required Color bg,
    bool highlight = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: highlight ? Border.all(color: Colors.purple, width: 2) : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF2E1A5C),
            child: Text(initials, style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text("Score: $score", style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Source: $source",
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}
