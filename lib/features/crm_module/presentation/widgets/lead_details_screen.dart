import 'package:flutter/material.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lead Details'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Documents'),
              Tab(text: 'Tasks'),
              Tab(text: 'Communication'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _OverviewTab(),
            _DocumentsTab(),
            _TasksTab(),
            _CommunicationTab(),
          ],
        ),
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Customer'), subtitle: Text('Rahul Sharma')),
        ListTile(title: Text('Loan Type'), subtitle: Text('Home Loan')),
        ListTile(title: Text('Loan Amount'), subtitle: Text('₹25,00,000')),
        ListTile(title: Text('Status'), subtitle: Text('Processing')),
      ],
    );
  }
}

class _DocumentsTab extends StatelessWidget {
  const _DocumentsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(leading: Icon(Icons.file_present), title: Text('PAN Card')),
        ListTile(
          leading: Icon(Icons.file_present),
          title: Text('Aadhaar Card'),
        ),
        ListTile(leading: Icon(Icons.file_present), title: Text('ITR')),
        ListTile(leading: Icon(Icons.file_present), title: Text('GST')),
      ],
    );
  }
}

class _TasksTab extends StatelessWidget {
  const _TasksTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tasks related to this lead'));
  }
}

class _CommunicationTab extends StatelessWidget {
  const _CommunicationTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('WhatsApp / Call / Notes'));
  }
}
