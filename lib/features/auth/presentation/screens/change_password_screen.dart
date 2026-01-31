import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_crm/features/auth/presentation/widgets/app_input_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,

          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/Rectangle 58.png'),
                    Positioned(
                      top: 30,
                      left: 15,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 15,
                      child: Text(
                        'Change \n Password',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppInputField(
                      controller: userController,
                      hintText: 'Eamil',
                    ),
                    AppInputField(
                      controller: userController,
                      hintText: 'Enter OTP',
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  'The OTP will expire in 10 min. Click here to ',
                            ),
                            TextSpan(
                              text: ' \n resend',
                              style: const TextStyle(
                                color: Color(0xFF2E1B5B), // highlight color
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // 👉 resend OTP logic
                                  print("Resend tapped");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                    AppInputField(
                      controller: passController,
                      hintText: 'New Password',
                    ),
                    AppInputField(
                      controller: passController,
                      hintText: 'Confirm Password',
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: button action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF2E1B5B,
                          ), // dark purple
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
