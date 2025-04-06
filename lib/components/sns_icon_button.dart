import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SnsIconButton extends StatelessWidget {
  const SnsIconButton({
    required this.icon,
    required this.overlayText,
    required this.url,
    super.key,
  });

  final IconData icon;
  final String overlayText;
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: overlayText,
      child: IconButton(
        onPressed: () async {
          final canLaunch = await canLaunchUrl(Uri.parse(url));
          if (canLaunch) {
            await launchUrl(Uri.parse(url));
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('URLを開けませんでした。\n$url'),
                ),
              );
            }
          }
        },
        icon: Icon(
          icon,
          color: theme.colorScheme.onPrimary,
          size: 28,
        ),
      ),
    );
  }
}
