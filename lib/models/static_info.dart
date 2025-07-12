import 'package:you22fy/models/academic_background.dart';
import 'package:you22fy/models/research.dart';
import 'package:you22fy/models/work_history.dart';
import 'package:you22fy/models/qualification.dart';

class StaticInfo {
  final List<AcademicBackground> academicBackgrounds;
  final List<Qualification> qualifications;
  final List<Research> researches;
  final List<WorkHistory> workHistories;

  const StaticInfo({
    required this.academicBackgrounds,
    required this.qualifications,
    required this.researches,
    required this.workHistories,
  });

  factory StaticInfo.fromJson(Map<String, dynamic> json) {
    return StaticInfo(
      academicBackgrounds: (json['academic_background'] as List<dynamic>?)
              ?.map((e) => AcademicBackground.fromJson(e))
              .toList() ??
          [],
      qualifications: (json['qualifications'] as List<dynamic>?)
              ?.map((e) => Qualification.fromJson(e))
              .toList() ??
          [],
      researches: (json['researches'] as List<dynamic>?)
              ?.map((e) => Research.fromJson(e))
              .toList() ??
          [],
      workHistories: (json['work_history'] as List<dynamic>?)
              ?.map((e) => WorkHistory.fromJson(e))
              .toList() ??
          [],
    );
  }
}
