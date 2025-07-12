class AcademicBackground {
  final String name;
  final String from;
  final String to;

  const AcademicBackground({
    required this.name,
    required this.from,
    required this.to,
  });

  factory AcademicBackground.fromJson(Map<String, dynamic> json) {
    return AcademicBackground(
      name: json['name'],
      from: json['from'],
      to: json['to'],
    );
  }
}
