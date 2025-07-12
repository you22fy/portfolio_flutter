import 'package:flutter/material.dart';
import 'package:you22fy/components/app_table_view.dart';
import 'package:you22fy/components/section_builder.dart';
import 'package:you22fy/models/qualification.dart';

class QualificationSection extends StatelessWidget {
  const QualificationSection({
    required this.qualifications,
    super.key,
  });

  final List<Qualification> qualifications;

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: '資格・受賞',
      builder: (context) {
        final theme = Theme.of(context);
        final textStyle = theme.textTheme.bodyMedium;
        final headerStyle = theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
        );

        return AppTableView(
          headers: const ['名称', '取得年月'],
          data: qualifications.map((q) {
            return [
              q.name,
              q.date,
            ];
          }).toList(),
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1),
          },
          headerStyle: headerStyle,
          textStyle: textStyle,
        );
      },
    );
  }
}
