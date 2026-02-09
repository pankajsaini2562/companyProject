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
import 'package:mobile_crm/features/crm_module/presentation/screens/crm_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mobile_crm/features/dashboard/presentation/widgets/report_screen.dart';
import 'package:mobile_crm/features/document_screen.dart/presentation/screens/document_application_screen.dart';
import 'package:mobile_crm/features/employee_dashboard/presentation/screens/employee_dashboard_screen.dart';
import 'package:mobile_crm/features/feedback/presentation/screens/feedback_suggestion_screen.dart';
import 'package:mobile_crm/features/hr/presentation/screens/hr.dart';
import 'package:mobile_crm/features/integration/presentation/screens/integrations_screen.dart';
import 'package:mobile_crm/features/leads/presentation/screens/new_lead_screen.dart';
import 'package:mobile_crm/features/loans/presentation/screens/loanssection.dart';
import 'package:mobile_crm/features/reports/presentation/screens/report_screen.dart';
import 'package:mobile_crm/features/settings/presentation/screens/setting_screen.dart';
import 'package:mobile_crm/features/side_menu.dart/app_drawer.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/new_task_screen.dart';
import 'package:mobile_crm/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:mobile_crm/features/wfh/presentation/screens/wfh_dashboard_screen.dart'
    hide WFHMonitorScreen;
import 'package:mobile_crm/main_layout.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 218, 2, 2),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
