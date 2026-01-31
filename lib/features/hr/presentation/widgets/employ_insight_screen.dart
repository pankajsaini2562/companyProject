import 'package:flutter/material.dart';

class EmployeeInsightsScreen extends StatelessWidget {
  const EmployeeInsightsScreen({Key? key, required String employeeName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B1B6E),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Employee Insights",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: Container(
          width: 380,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _personalInfo(),
                const SizedBox(height: 12),
                _workInfo(),
                const SizedBox(height: 16),
                _calendar(),
                const SizedBox(height: 16),
                _analytics(),
                const SizedBox(height: 16),
                _remarks(),
                const SizedBox(height: 16),
                _buttons(context),
                const SizedBox(height: 16),
                _feedbackBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🧑 Personal Information
  Widget _personalInfo() {
    return _card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Name : Rahul Mishra"),
                  Text("Employee ID : T1009"),
                  Text("Department : Training Officer"),
                  Text("Phone : 987654XXXX"),
                  Text("Email : rahulmishra@work.com"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 💼 Work Info
  Widget _workInfo() {
    return _card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Work Information",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Work Mode : Remote"),
          Text("Date of Joining : 24 April 2025"),
          Text("Salary : 35k"),
        ],
      ),
    );
  }

  // 📅 Calendar (UI only)
  Widget _calendar() {
    return _card(
      Column(
        children: [
          const Text("October", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 31,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 7 ? Colors.purple.shade200 : Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
          ),
          const SizedBox(height: 4),
          const Text("2025", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // 📊 Analytics
  Widget _analytics() {
    return _card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("ANALYTICS", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Attendance : 97%"),
          Text("Performance Rating : 8.7/10"),
          Text("Targets Achieved : 86%"),
        ],
      ),
    );
  }

  // 📝 Remarks
  Widget _remarks() {
    return _card(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Remarks", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text("• Has worked with over 85 clients."),
          Text("• Has trained 15 new candidates."),
          Text("• Performance has increased by 7%."),
          Text("• Active in team activities."),
          Text("• Achieved 95% target last month."),
        ],
      ),
    );
  }

  // 🔘 Buttons
  Widget _buttons(BuildContext context) {
    return Column(
      children: [
        _mainButton("Download Report", () {}),
        const SizedBox(height: 8),
        _mainButton("Contact Employee", () {}),
      ],
    );
  }

  // ✍ Feedback Box
  Widget _feedbackBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Feedback ✍",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Write feedback here...",
          ),
        ),
      ],
    );
  }

  // 🔹 Reusable Card
  Widget _card(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  // 🔹 Reusable Button
  Widget _mainButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B1B6E),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
