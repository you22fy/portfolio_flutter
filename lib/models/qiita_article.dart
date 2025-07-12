class QiitaArticle {
  final String id;
  final int commentsCount;
  final int likesCount;
  final bool private;
  final int stocksCount;
  final String title;
  final String url;
  final int pageViewsCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const QiitaArticle({
    required this.id,
    required this.commentsCount,
    required this.likesCount,
    required this.private,
    required this.stocksCount,
    required this.title,
    required this.url,
    required this.pageViewsCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QiitaArticle.fromJson(Map<String, dynamic> json) {
    return QiitaArticle(
      id: json['id'],
      commentsCount: json['comments_count'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
      private: json['private'],
      stocksCount: json['stocks_count'] ?? 0,
      title: json['title'],
      url: json['url'],
      pageViewsCount: json['page_views_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
