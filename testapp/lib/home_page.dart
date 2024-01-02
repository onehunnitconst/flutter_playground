import 'package:flutter/material.dart';
import 'package:testapp/text_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextContainer(text: 'Hello'),
            TextContainer(text: 'Sangsu'),
            TextContainer(text: 'Good'),
          ],
        ),
      ),
    );
  }
}
