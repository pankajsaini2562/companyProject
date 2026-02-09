import 'package:flutter/material.dart';
// import 'package:mobile_crm/features/auth/presentation/screens/login_screen.dart';
// import 'package:mobile_crm/features/auth/presentation/screens/signup_screen.dart';
// import 'package:mobile_crm/features/auth/presentation/widgets/app_input_field.dart';
// import 'package:mobile_crm/features/auth/presentation/widgets/support_widget.dart';
// import 'package:flutter/gestures.dart';
// import 'package:mobile_crm/features/dashboard/presentation/screens/dashboard_screen.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   final userController = TextEditingController();
//   final passController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(right: 25, left: 25),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/Rectangle 23.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Welcome User! ', style: AppWidget.headlineTextStyle(30)),
//             const SizedBox(height: 40),
//             AppInputField(controller: userController, hintText: 'Enter UserID'),
//             AppInputField(
//               controller: passController,
//               hintText: 'Enter Password',
//             ),

//             Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const LoginScreen(role: ''),
//                     ),
//                   );
//                 },

//                 child: Text(
//                   'Forgot Password?',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 35),

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18),
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFB39DFF), Color(0xFF8F7CFF)],
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(18),
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const DashboardScreen(),
//                       ),
//                     );
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 14),
//                     child: Center(
//                       child: Text(
//                         "LOG IN",
//                         style: TextStyle(
//                           color: Color(0xFF2B1D4F),
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             Align(
//               alignment: Alignment.centerRight,
//               child: RichText(
//                 text: TextSpan(
//                   style: const TextStyle(fontSize: 14),
//                   children: [
//                     const TextSpan(
//                       text: "New here? ",
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Sign up now!",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),

//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const SignupScreen(),
//                             ),
//                           );
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
