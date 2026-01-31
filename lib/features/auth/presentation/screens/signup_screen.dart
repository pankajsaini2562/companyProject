import 'package:flutter/material.dart';
import 'package:mobile_crm/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile_crm/features/auth/presentation/widgets/support_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 15, left: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Rectangle 23.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 65),
            Text('Sign Up ', style: AppWidget.headlineTextStyle(22)),
            AppInputField(
              controller: userController,
              hintText: 'Enter First name',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Last name',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter age ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Email ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Password ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Confirm Password ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Employee ID ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Employee Department ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),
            AppInputField(
              controller: userController,
              hintText: 'Enter Employee Date of joining ',
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            ),

            const SizedBox(height: 55),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [Color(0xFFB39DFF), Color(0xFF8F7CFF)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                    color: Color(0xFF2B1D4F),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
