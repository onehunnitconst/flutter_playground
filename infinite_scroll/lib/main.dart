import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll/api/articles_repository.dart';
import 'package:infinite_scroll/home_page_view_model.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<Dio>(
        create: (context) => Dio(
          BaseOptions(
            baseUrl: 'https://6591136f8cbbf8afa96bde66.mockapi.io/api/v1',
          ),
        ),
      ),
      Provider<ArticlesRepository>(
        create: (context) => ArticlesRepository(
          client: context.read<Dio>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => HomePageViewModel(
          repository: context.read<ArticlesRepository>(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
