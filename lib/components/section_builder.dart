import 'package:flutter/material.dart';

class SectionBuilder extends StatelessWidget {
  const SectionBuilder({
    required this.title,
    required this.builder,
    super.key,
  });

  final String title;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: theme.colorScheme.primary,
              width: 6,
              height: 32,
            ),
            const SizedBox(width: 8),
            Text(title, style: theme.textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: 16),
        builder(context),
      ],
    );
  }
}
