import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_crm/features/leads/presentation/widgets/lead_detail_screen.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';
import 'package:mobile_crm/features/tasks/presentation/widgets/donut_painter.dart';
import 'package:mobile_crm/features/tasks/presentation/widgets/new_task.dart';
import 'package:mobile_crm/features/tasks/presentation/widgets/status_box.dart';
import 'package:mobile_crm/features/tasks/presentation/widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                  'Task Management',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        physics: const NeverScrollableScrollPhysics(),

                        children: [
                          StatusBox(
                            count: "24",
                            title: "Completed",
                            color: Color(0xFF6DC16D),
                            icon: Icons.check_circle_outline,
                          ),
                          StatusBox(
                            count: "09",
                            title: "Overdue",
                            color: Color(0xFFE60000),
                            icon: Icons.error_outline,
                          ),
                          StatusBox(
                            count: "18",
                            title: "Due soon",
                            color: Color(0xFFF07A4A),
                            icon: Icons.access_time,
                          ),
                          StatusBox(
                            count: "12",
                            title: "In progress",
                            color: Color(0xFF4BB3D3),
                            icon: Icons.play_circle_outline,
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      SizedBox(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E245E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewTasksScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create new",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Text(
                        "Today's task",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TaskCard(
                        title: 'Follow up with 2 new leads',
                        time: '10:00 AM',
                      ),
                      TaskCard(
                        title: 'Follow up with 2 new leads',
                        time: '10:00 AM',
                      ),
                      TaskCard(
                        title: 'Follow up with 2 new leads',
                        time: '10:00 AM',
                      ),
                      TaskCard(
                        title: 'Follow up with 2 new leads',
                        time: '10:00 AM',
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                  ),

                  child: Column(
                    children: [
                      Text(
                        'Monyhly Progress',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      CustomPaint(
                        size: const Size(160, 160),
                        painter: DonutPainter(
                          percentage: 80,
                          progressColor: const Color(0xFF7B6CFF),
                          backgroundColor: Colors.grey.shade300,
                          strokeWidth: 20,
                        ),
                      ),
                      Text(
                        '${80.toInt()}%',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
