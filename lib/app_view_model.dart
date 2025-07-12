import 'package:flutter/material.dart';
import 'package:you22fy/models/qiita_article.dart';
import 'package:you22fy/models/static_info.dart';
import 'package:you22fy/repositories/drive.dart';
import 'package:you22fy/repositories/qiita.dart';

class AppViewModel extends ChangeNotifier {
  final DriveRepository driveRepository = DriveRepository();
  final QiitaRepository qiitaRepository = QiitaRepository();

  StaticInfo? staticInfo;
  List<QiitaArticle>? qiitaArticles;
  bool isLoading = false;
  String? errorMessage;

  Future<void> initState() async {
    isLoading = true;
    notifyListeners();

    try {
      await Future.wait([
        getStaticInfo(),
        getQiitaArticles(),
      ]);
      errorMessage = null;
    } catch (e) {
      errorMessage = "Failed to load data";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getStaticInfo() async {
    try {
      staticInfo = await driveRepository.getStaticJson();
    } catch (e) {
      throw Exception('Failed to get static info');
    }
  }

  Future<void> getQiitaArticles() async {
    try {
      qiitaArticles = await qiitaRepository.getArticles();
    } catch (e) {
      throw Exception('Failed to get Qiita articles');
    }
  }
}
