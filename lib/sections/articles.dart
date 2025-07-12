import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';
import 'package:you22fy/models/qiita_article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({
    required this.articles,
    super.key,
  });

  final List<QiitaArticle> articles;
  @override
  Widget build(BuildContext context) {
    return SectionBuilder(
      title: 'Qiita記事',
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          if (article.private) return const SizedBox.shrink();
          return ListTile(
            title: Text(article.title),
            subtitle: Text(
              '${article.createdAt.year}/${article.createdAt.month}/${article.createdAt.day} • ${article.likesCount} いいね',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${article.pageViewsCount} views',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () async {
              final Uri url = Uri.parse(article.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          );
        },
      ),
    );
  }
}
