import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:you22fy/models/static_info.dart';

class DriveRepository {
  final Dio dio;

  DriveRepository() : dio = Dio();

  Future<StaticInfo> getStaticJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/data.json');

      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      return StaticInfo.fromJson(jsonMap);
    } catch (e) {
      throw Exception('Failed to get static info: $e');
    }
  }
}
