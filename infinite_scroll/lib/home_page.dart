import 'package:flutter/material.dart';
import 'package:infinite_scroll/home_page_view_model.dart';
import 'package:infinite_scroll/widgets/article_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: ArticleListView(
        controller: viewModel.controller,
        articles: viewModel.articles,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.getArticles();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
