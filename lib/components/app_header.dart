import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you22fy/components/sns_icon_button.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      shadowColor: theme.colorScheme.shadow,
      elevation: 24,
      title: Text(
        'Yuki Fujita',
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
      actions: [
        SnsIconButton(
          icon: FontAwesomeIcons.github,
          overlayText: 'GitHub',
          url: 'https://github.com/you22fy',
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
