import 'package:danggn/pages/article/widgets/article_body.dart';
import 'package:danggn/pages/article/widgets/article_list.dart';
import 'package:danggn/pages/article/widgets/article_location.dart';
import 'package:danggn/pages/article/widgets/article_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late bool _trigger;
  late final ScrollController _controller;

  @override
  void initState() {
    _trigger = false;
    _controller = ScrollController()
      ..addListener(
        () {
          setState(() {
            _trigger = _controller.offset > 200.0;
          });
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.back,
                        color: _trigger ? Colors.black : Colors.white),
                    Icon(CupertinoIcons.home,
                        color: _trigger ? Colors.black : Colors.white),
                  ],
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.share,
                        color: _trigger ? Colors.black : Colors.white),
                    Icon(CupertinoIcons.ellipsis_vertical,
                        color: _trigger ? Colors.black : Colors.white),
                  ],
                )
              ],
            ),
            pinned: true,
            expandedHeight: expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/sample.jpeg",
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
            ),
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ArticleProfile(),
                Divider(height: 0, color: Color(0xFFf2f3f7)),
                ArticleBody(),
                ArticleLocation(),
                ArticleList(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(height: 100.0),
    );
  }
}
