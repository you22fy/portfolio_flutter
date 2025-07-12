class WorkHistory {
  final String name;
  final String description;
  final String from;
  final String to;

  const WorkHistory({
    required this.name,
    required this.description,
    required this.from,
    required this.to,
  });

  factory WorkHistory.fromJson(Map<String, dynamic> json) {
    return WorkHistory(
      name: json['name'],
      description: json['description'],
      from: json['from'],
      to: json['to'],
    );
  }
}
