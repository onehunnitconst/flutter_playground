import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:infinite_scroll/domain/article.dart';

class ArticlesRepository {
  final Dio client;

  ArticlesRepository({required this.client});

  Future<List<Article>> getArticles({
    required int page,
    required int limit,
  }) async {
    try {
      final Response<List> response = await client.get(
        '/articles',
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      return response.data!.map((e) => Article.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception('데이터를 가져오는 데 실패하였습니다. (${e.message})');
    }
  }
}
