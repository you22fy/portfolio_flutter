import 'package:flutter/material.dart';
// import 'package:you22fy/sections/background.dart';
import 'package:you22fy/sections/profile.dart';
import 'package:you22fy/sections/qualification.dart';
import 'package:you22fy/sections/research.dart';
// import 'package:you22fy/sections/skill.dart';
import 'package:you22fy/sections/works.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          spacing: 32,
          children: [
            const ProfileSection(),
            const ResearchSection(),
            // const BackgroundSection(),
            // const SkillSection(),
            const QualificationSection(),
            const WorksSection(),
          ],
        ),
      ),
    );
  }
}
