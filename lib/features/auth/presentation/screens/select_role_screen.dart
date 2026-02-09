// import 'package:flutter/material.dart';
// import 'package:mobile_crm/features/auth/presentation/screens/login_screen.dart';

// class SelectRoleScreen extends StatelessWidget {
//   const SelectRoleScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // App Logo (small)
//               Center(
//                 child: Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Center(
//                     child: Text('LOGO', style: TextStyle(fontSize: 10)),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Heading
//               const Text(
//                 'Continue as',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 16),

//               // Role Cards
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoleCard(
//                               icon: Icons.admin_panel_settings,
//                               title: 'Admin',
//                               description: 'Manage system & users',
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) =>
//                                         const LoginScreen(role: 'Admin'),
//                                   ),
//                                 ); // Navigate to Login
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: RoleCard(
//                               icon: Icons.people,
//                               title: 'HR',
//                               description: 'Handle employees & payroll',
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) =>
//                                         const LoginScreen(role: 'HR'),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoleCard(
//                               icon: Icons.badge,
//                               title: 'Employee',
//                               description: 'Access your workspace',
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) =>
//                                         const LoginScreen(role: 'Employee'),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: RoleCard(
//                               icon: Icons.handshake,
//                               title: 'Partner',
//                               description: 'Collaborate & track',
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) =>
//                                         const LoginScreen(role: 'Partner'),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       // Full width card
//                       RoleCard(
//                         icon: Icons.person_outline,
//                         title: 'Client',
//                         description: 'View services & reports',
//                         isFullWidth: true,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const LoginScreen(role: 'Client'),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoleCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final VoidCallback onTap;
//   final bool isFullWidth;

//   const RoleCard({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.onTap,
//     this.isFullWidth = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: isFullWidth ? double.infinity : null,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Icon circle
//             CircleAvatar(
//               radius: 22,
//               backgroundColor: Colors.blue.shade50,
//               child: Icon(icon, color: Colors.blue),
//             ),
//             const SizedBox(height: 12),

//             // Role name
//             Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),

//             const SizedBox(height: 4),

//             // Description
//             Text(
//               description,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 12, color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
