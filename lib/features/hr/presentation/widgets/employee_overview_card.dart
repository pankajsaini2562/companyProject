import 'package:flutter/material.dart';
import 'package:mobile_crm/features/hr/presentation/widgets/employ_insight_screen.dart'
    show EmployeeInsightsScreen;

class EmployeeOverviewCard extends StatelessWidget {
  const EmployeeOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Employee Overview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _employeeTile(
              context: context,
              initials: 'RM',
              name: 'Rahul Mishra',
              role: 'Training Officer',
              roleColor: Colors.green,
              attendance: '97%',
              performance: '87%',
            ),

            _employeeTile(
              context: context,
              initials: 'NM',
              name: 'Nikhil Mittal',
              role: 'Sales Manager',
              roleColor: Colors.red,
              attendance: '95%',
              performance: '96%',
            ),

            _employeeTile(
              context: context,
              initials: 'PS',
              name: 'Priya Sharma',
              role: 'Operation Lead',
              roleColor: Colors.blue,
              attendance: '88%',
              performance: '91%',
            ),

            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('VIEW ALL'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _employeeTile({
    required BuildContext context,
    required String initials,
    required String name,
    required String role,
    required Color roleColor,
    required String attendance,
    required String performance,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const EmployeeInsightsScreen(employeeName: ''),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F6FB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple,
              child: Text(
                initials,
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
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(fontSize: 11, color: roleColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _stat('Attendance', attendance),
                      _stat('Performance', performance),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
