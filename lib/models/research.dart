class Research {
  final String title;
  final String date;
  final String paper;
  final String poster;
  final String slide;
  final String additional;
  final bool isReview;

  const Research({
    required this.title,
    required this.date,
    required this.paper,
    required this.poster,
    required this.slide,
    required this.additional,
    required this.isReview,
  });

  factory Research.fromJson(Map<String, dynamic> json) {
    return Research(
      title: json['title'],
      date: json['date'],
      paper: json['paper'],
      poster: json['poster'],
      slide: json['slide'],
      additional: json['additional'],
      isReview: json['is_review'],
    );
  }
}
