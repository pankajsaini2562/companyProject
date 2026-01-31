import 'package:flutter/material.dart';

class TaskInfoScreen extends StatelessWidget {
  const TaskInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2B82),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Task Title"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionText(
                title: "Task:",
                value: "Follow up with a new lead: Niharika Kaushik",
              ),
              SectionText(title: "Time:", value: "10:00 AM, Thursday"),
              SectionText(title: "Priority:", value: "HIGH"),

              SizedBox(height: 16),
              SectionHeader(title: "CLIENT INFORMATION:"),
              BulletText("Niharika Kaushik"),
              BulletText("26 (F)"),
              BulletText("niharika.work@gmail.com"),

              SizedBox(height: 16),
              SectionHeader(title: "Service Enquired:"),
              Text("Business Loan", style: TextStyle(fontSize: 14)),

              SizedBox(height: 16),
              SectionHeader(title: "Assigned to:"),
              Text("You", style: TextStyle(fontSize: 14)),

              SizedBox(height: 16),
              SectionHeader(title: "Details:"),
              Text(
                "Niharika recently filled out an online inquiry form regarding a business loan for expanding her small clothing boutique. She has expressed interest in flexible repayment options and minimal documentation requirements. Initial contact was made through a welcome email sent on Tuesday, but no response has been received yet.",
                style: TextStyle(fontSize: 14),
              ),

              SizedBox(height: 16),
              SectionHeader(title: "Objective of Follow-up:"),
              BulletText("Confirm her business requirements and loan amount."),
              BulletText(
                "Explain available business loan plans, eligibility, and processing time.",
              ),
              BulletText(
                "Schedule a virtual consultation if she's interested.",
              ),
              BulletText(
                "Encourage her to upload necessary KYC and business documents.",
              ),

              SizedBox(height: 16),
              SectionHeader(title: "Next Steps:"),
              BulletText(
                "Record the outcome of the call (interested/not interested/needs follow-up).",
              ),
              BulletText("Update CRM with conversation notes."),
              BulletText(
                "If interested, set up document collection or loan eligibility check.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable widgets

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}

class SectionText extends StatelessWidget {
  final String title;
  final String value;

  const SectionText({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: "$title ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
