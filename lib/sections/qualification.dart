import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:you22fy/components/app_table_view.dart';
import 'package:you22fy/components/section_builder.dart';

typedef Qualification = ({
  String name,
  DateTime date,
});

class QualificationSection extends StatelessWidget {
  const QualificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: notionのDBから取得するようにする
    final qualifications = [
      ('応用情報技術者試験(AP)', DateTime(2024, 12, 26)),
      ('TOEIC Listening & Reading 815点', DateTime(2024, 12, 8)),
      ('情報セキュリティマネジメント試験(SG)', DateTime(2024, 10, 1)),
      ('基本情報技術者試験(FE)', DateTime(2024, 4, 12)),
      ('TOEIC Listening & Reading 795点', DateTime(2024, 2, 25)),
      ('TOEIC Listening & Reading 760点', DateTime(2023, 11, 20)),
      ('令和4年度福岡大学特待生表彰', DateTime(2022, 6, 11)),
      ('TOEIC Listening & Reading 805点', DateTime(2022, 2, 27)),
      ('TOEIC Listening & Reading 820点', DateTime(2021, 12, 19)),
      ('TOEIC Listening & Reading 815点', DateTime(2021, 9, 12)),
      ('TOEIC Listening & Reading 750点', DateTime(2021, 6, 20)),
      ('実用英語技能検定2級', DateTime(2019, 1, 12)),
      ('実用英語技能検定準2級 ', DateTime(2018, 11, 16)),
      ('実用英語技能検定3級', DateTime(2017, 11, 17)),
      ('実用英語技能検定4級', DateTime(2017, 10, 19)),
    ];

    // AppTableView 用にデータを整形
    final tableData = qualifications.map((q) {
      return [
        q.$1, // 名称
        DateFormat('yyyy/MM').format(q.$2), // 取得年月
      ];
    }).toList();

    return SectionBuilder(
      title: '資格・受賞',
      builder: (context) {
        final theme = Theme.of(context);
        final textStyle = theme.textTheme.bodyMedium;
        final headerStyle = theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
        );

        // AppTableView を使用するように変更
        return AppTableView(
          headers: const ['名称', '取得年月'],
          data: tableData,
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1),
          },
          headerStyle: headerStyle, // スタイルを渡す
          textStyle: textStyle, // スタイルを渡す
        );
      },
    );
  }
}
