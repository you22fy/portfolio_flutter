import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:you22fy/env/env.dart';
import 'package:you22fy/models/qiita_article.dart';

class QiitaRepository {
  final Dio dio;

  QiitaRepository() : dio = Dio();

  Future<List<QiitaArticle>> getArticles() async {
    try {
      const userId = 'Yu_unI1';
      final response = await dio.get(
        'https://qiita.com/api/v2/users/$userId/items?per_page=100',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Env.qiitaApiKey}',
          },
        ),
      );

      final List<QiitaArticle> result = List<QiitaArticle>.from(
        response.data.map(
          (e) => QiitaArticle.fromJson(e),
        ),
      );

      return result;
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      throw Exception('Failed to get Qiita articles');
    }
  }
}
