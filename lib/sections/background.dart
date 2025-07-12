import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';
import 'package:you22fy/models/work_history.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({
    required this.workHistories,
    super.key,
  });

  final List<WorkHistory> workHistories;

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: '経歴',
      builder: (context) {
        return Column(
          children: [
            for (final workHistory in workHistories) ...[
              Text(workHistory.name),
            ],
          ],
        );
      },
    );
  }
}
