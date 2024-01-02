import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinite_scroll/home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<HomePageViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: ListView(
        children: [
          ...viewModel.articles
              .asMap()
              .entries
              .map(
                (entry) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color:
                        entry.key.isEven ? Colors.white : Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        entry.value.thumbnail,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.value.title,
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              entry.value.contents,
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.black87,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          Center(
            child: IconButton(
              onPressed: () {
                viewModel.getArticles();
              },
              icon: const Icon(Icons.arrow_downward),
            ),
          )
        ],
      ),
    );
  }
}
