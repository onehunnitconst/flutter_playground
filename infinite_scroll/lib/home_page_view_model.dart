import 'package:flutter/material.dart';
import 'package:infinite_scroll/api/articles_repository.dart';
import 'package:infinite_scroll/domain/article.dart';

class HomePageViewModel with ChangeNotifier {
  late final List<Article> articles;
  late int _page;
  late final int _limit;
  late final ScrollController controller;
  final ArticlesRepository _repository;

  HomePageViewModel(
      {required ArticlesRepository repository, int page = 1, int limit = 10})
      : _repository = repository,
        _page = page,
        _limit = limit {
    articles = [];
    controller = ScrollController();
  }

  void getArticles() async {
    final List<Article> newArticles =
        await _repository.getArticles(page: _page, limit: _limit);

    if (newArticles.isNotEmpty) {
      articles.addAll(newArticles);
      if (newArticles.length >= _limit) {
        _page++;
      }
    }

    notifyListeners();
  }
}
