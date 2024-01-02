import 'package:flutter/material.dart';
import 'package:infinite_scroll/domain/article.dart';
import 'package:infinite_scroll/util/iterable_extension.dart';
import 'package:infinite_scroll/widgets/article_list_tile.dart';

class ArticleListView extends StatelessWidget {
  final List<Article> articles;
  final ScrollController controller;

  const ArticleListView({
    super.key,
    required this.controller,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: articles
          .mapIndex(
            (article, index) => ArticleListTile(
              index: index,
              article: article,
            ),
          )
          .toList(),
    );
  }
}
