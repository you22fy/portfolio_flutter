import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:you22fy/components/section_builder.dart';
import 'package:you22fy/models/research.dart';

class ResearchSection extends StatelessWidget {
  const ResearchSection({
    required this.researches,
    super.key,
  });

  final List<Research> researches;

  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: '研究',
      builder: (context) {
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final research in researches) ...[
              _ResearchCard(research: research),
              const Divider(),
            ],
          ],
        );
      },
    );
  }
}

class _ResearchCard extends StatelessWidget {
  const _ResearchCard({
    required this.research,
  });

  final Research research;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (research.isReview)
              Tooltip(
                message: '査読有り',
                child: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            const SizedBox(width: 4),
            Text(
              research.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Text(
          research.date,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Row(
          spacing: 8,
          children: [
            if (research.paper.isNotEmpty)
              _buildTile(context, "paper", research.paper),
            if (research.poster.isNotEmpty)
              _buildTile(context, "poster", research.poster),
            if (research.slide.isNotEmpty)
              _buildTile(context, "slide", research.slide),
            if (research.additional.isNotEmpty)
              _buildTile(context, "additional", research.additional),
          ],
        )
      ],
    );
  }

  Widget _buildTile(BuildContext context, String text, String url) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
