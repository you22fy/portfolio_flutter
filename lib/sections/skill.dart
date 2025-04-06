import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'スキル',
      builder: (context) => Text('Skill'),
    );
  }
}
