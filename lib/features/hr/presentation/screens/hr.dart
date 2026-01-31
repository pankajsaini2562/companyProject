import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_crm/features/hr/presentation/widgets/department_performance_card';
import 'package:mobile_crm/features/hr/presentation/widgets/document_card.dart';
import 'package:mobile_crm/features/hr/presentation/widgets/employee_overview_card.dart';
import 'package:mobile_crm/features/hr/presentation/widgets/hr_analysis_card.dart';
import 'package:mobile_crm/features/hr/presentation/widgets/training_resource_card.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class HR extends StatefulWidget {
  const HR({super.key});

  @override
  State<HR> createState() => _HRState();
}

class _HRState extends State<HR> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B1D4F),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              child: SvgPicture.asset(
                'assets/icons/Ellipse_1.svg', // rename recommended
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              HrAnalysisCard(),
              EmployeeOverviewCard(),
              DocumentLockerCard(),
              DepartmentPerformanceCard(),
              TrainingResourcesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
