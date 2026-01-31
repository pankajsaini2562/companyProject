import 'package:flutter/material.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/task_title.dart';

class UpcomingTasksCard extends StatefulWidget {
  const UpcomingTasksCard({super.key});

  @override
  State<UpcomingTasksCard> createState() => _UpcomingTasksCardState();
}

class _UpcomingTasksCardState extends State<UpcomingTasksCard> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    // Initial load of tasks, could be from API/fake delay
    loadTasks();
  }

  void loadTasks() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      tasks = [
        TaskModel(
          title: "Follow up with 2 new leads",
          time: "2 hrs ago",
          color: Colors.red,
        ),
        TaskModel(
          title: "Notify client of loan approval",
          time: "3 hrs ago",
          color: Colors.orange,
        ),
        TaskModel(
          title: "Complete CIBIL check for Priya M.",
          time: "3 hrs ago",
          color: Colors.deepOrange,
        ),
        TaskModel(
          title: "Review Client documents",
          time: "5 hrs ago",
          color: Colors.blue,
        ),
        TaskModel(
          title: "Prepare commission report",
          time: "6 hrs ago",
          color: Colors.green,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Tasks",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          tasks.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskInfoScreen(),
                          ),
                        );
                      },
                      child: _taskTile(
                        color: task.color,
                        title: task.title,
                        time: task.time,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _taskTile({
    required Color color,
    required String title,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskModel {
  final String title;
  final String time;
  final Color color;

  TaskModel({required this.title, required this.time, required this.color});
}
