import 'package:flutter/material.dart';

class MessageAtom extends StatelessWidget {
  final bool isMyMessage;
  final String message;

  const MessageAtom(
      {super.key, required this.isMyMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isMyMessage ? Colors.amber.shade200 : Colors.grey.shade200,
        ),
        constraints: const BoxConstraints(
          maxWidth: 200,
        ),
        child: Text(message),
      ),
    );
  }
}
