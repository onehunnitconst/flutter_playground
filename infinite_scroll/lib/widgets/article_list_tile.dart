import 'package:flutter/material.dart';
import 'package:infinite_scroll/domain/article.dart';

class ArticleListTile extends StatelessWidget {
  final int index;
  final Article article;

  const ArticleListTile({
    super.key,
    required this.index,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        color: index.isEven ? Colors.white : Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Image.network(
            article.thumbnail,
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
                  article.title,
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
                  article.contents,
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
    );
  }
}
