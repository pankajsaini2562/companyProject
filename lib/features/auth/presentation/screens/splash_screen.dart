import 'package:flutter/material.dart';
import 'package:mobile_crm/features/auth/presentation/screens/select_role_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    // Minimum splash duration (feels premium)
    await Future.delayed(const Duration(milliseconds: 800));

    // Future ready:
    // await checkAuthToken();
    // await loadConfig();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SelectRoleScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo Placeholder
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'LOGO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Tagline
              const Text(
                'CRM • HR • Accounting • WFH',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 40),

              // Loading Indicator
              const CircularProgressIndicator(strokeWidth: 2.5),
            ],
          ),
        ),
      ),
    );
  }
}
