import 'package:flutter/material.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/lead_detail_screen.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/new_lead_page.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({Key? key}) : super(key: key);

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["All", "Hot", "Warm", "Cold"];

  final List<Map<String, dynamic>> leads = [
    {
      "name": "Rakesh Kumar",
      "initials": "RK",
      "score": 92,
      "source": "Facebook | Docs Collection",
      "time": "2 hrs ago",
      "color": Color(0xFFFFE0D2),
    },
    {
      "name": "Priya Sharma",
      "initials": "PS",
      "score": 45,
      "source": "Referral | Application Drop",
      "time": "3 hrs ago",
      "color": Color(0xFFE8F3FF),
    },
    {
      "name": "Amit Patel",
      "initials": "AP",
      "score": 68,
      "source": "Facebook | Initial Contact",
      "time": "7 hrs ago",
      "color": Color(0xFFE6F4EA),
    },
    {
      "name": "Nikita Khattar",
      "initials": "NK",
      "score": 86,
      "source": "Meta Ads | Loan approval",
      "time": "23 hrs ago",
      "color": Color(0xFFFFE8DF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C1E6E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // 👈 back button white
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Leads",
          style: TextStyle(
            color: Colors.white, // 👈 title white
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // Tabs + Add button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _tabs(),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3C1E6E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewLeadPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Add new\nlead",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Lead List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: leads.length,
              itemBuilder: (context, index) {
                final lead = leads[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeadDetailsScreen(lead: lead),
                      ),
                    );
                  },
                  child: _leadCard(lead),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ================= Tabs =================
  Widget _tabs() {
    return Row(
      children: List.generate(tabs.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => setState(() => selectedTab = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: selectedTab == index
                    ? const Color(0xFFD9D1F0)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontSize: 13,
                  color: selectedTab == index
                      ? const Color(0xFF3D2A7A)
                      : Colors.black54,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // ================= Lead Card =================
  Widget _leadCard(Map<String, dynamic> lead) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lead["color"],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF2E1A5C),
            child: Text(
              lead["initials"],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      lead["name"],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Score: ${lead["score"]}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Source: ${lead["source"]}",
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
                Text(
                  lead["time"],
                  style: const TextStyle(fontSize: 10, color: Colors.black45),
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
