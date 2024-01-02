import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;

  const TextContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(text),
      color: Colors.amber,
    );
  }
}
