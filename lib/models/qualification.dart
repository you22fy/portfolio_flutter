class Qualification {
  final String name;
  final String date;

  const Qualification({
    required this.name,
    required this.date,
  });

  factory Qualification.fromJson(Map<String, dynamic> json) {
    return Qualification(
      name: json['name'],
      date: json['date'],
    );
  }
}
