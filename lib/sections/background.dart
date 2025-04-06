import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: '経歴',
      builder: (context) => Text('Background'),
    );
  }
}
