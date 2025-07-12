import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    final currentYear = DateTime.now().year;
    return Container(
      width: width,
      height: 60,
      color: theme.colorScheme.primary,
      child: Center(
        child: Text(
          '© $currentYear Yuki Fujita All rights reserved.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
