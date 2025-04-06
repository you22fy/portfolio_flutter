import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';

class ResearchSection extends StatelessWidget {
  const ResearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionBuilder(
      title: '研究',
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '卒業論文: '),
                  TextSpan(
                    text: '「二値分類モデルに基づく有価証券報告書を対象とした表解析手法の提案」',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '(2025年01月)'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
