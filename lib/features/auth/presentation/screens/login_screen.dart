import 'package:flutter/material.dart';
import 'package:mobile_crm/features/auth/presentation/screens/forgot_pass.dart';
import 'package:mobile_crm/features/auth/presentation/screens/mobile_otp_screen.dart';
import 'package:mobile_crm/features/auth/presentation/screens/otp_verification.dart';

class LoginScreen extends StatelessWidget {
  final String role;

  const LoginScreen({
    Key? key,
    required this.role, // e.g. Employee, Admin, HR
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top text
              Text(
                'Logging in as: $role',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 32),

              // Email / Mobile
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email / Mobile',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgotPass()),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),

              const Spacer(),

              // Login Button (Primary CTA)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 16),

              // OR
              const Center(
                child: Text('OR', style: TextStyle(color: Colors.black45)),
              ),

              const SizedBox(height: 16),

              // Login with OTP (Secondary)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MobileOtpScreen(),
                      ),
                    );
                  },
                  child: const Text('Login with OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
