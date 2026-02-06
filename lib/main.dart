import 'package:flutter/material.dart';
import 'package:mobile_crm/features/accounts/presentation/screens/account.dart';
import 'package:mobile_crm/features/auth/presentation/screens/change_password_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/forgot_passsword_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/login_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/profile_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/select_role_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/signup_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/splash_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/welcome_screen.dart';
import 'package:mobile_crm/features/chat/presentation/screens/chat_screen.dart';
import 'package:mobile_crm/features/clients/presentation/screens/client.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/admin_dashboard_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/report_screen.dart';
import 'package:mobile_crm/features/hr/presentation/screens/hr.dart';
import 'package:mobile_crm/features/leads/presentation/screens/new_lead_screen.dart';
import 'package:mobile_crm/features/settings/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/new_task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AdminDashboardScreen(),
    );
  }
}
