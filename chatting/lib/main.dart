import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chatting/message.dart';
import 'package:chatting/message_atom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _loading;
  late final String _id;
  late final MessageList _messageList;
  late final WebSocket _webSocket;
  late final TextEditingController _controller;

  void initState() {
    _id = (Random().nextInt(8999999) + 1000000).toString();
    _loading = false;
    _messageList = MessageList();
    _controller = TextEditingController();
    WebSocket.connect("ws://localhost:4300").then((ws) {
      setState(() {
        _webSocket = ws;
      });
      _webSocket.listen((event) {
        final res = jsonDecode(event);
        _messageList.add(Message.fromJson(res['data']));
      });
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _loading ? SingleChildScrollView(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: _messageList,
              builder: (context, child) => Column(
                children: _messageList
                    .get()
                    .map(
                      (e) => MessageAtom(
                        isMyMessage: e.id == _id,
                        message: e.message,
                      ),
                    )
                    .toList(),
              ),
            ),
            TextField(
              controller: _controller,
            ),
            TextButton(
              onPressed: () {
                final message = {
                  "event": "send",
                  "data": {
                    "id": _id,
                    "message": _controller.text,
                  },
                };
                _controller.clear();
                _webSocket.add(jsonEncode(message));
              },
              child: Text("send"),
            ),
            
          ],
        ),
      ): Container(),
    );
  }
}

class MessageList with ChangeNotifier {
  late final List<Message> messages;

  MessageList() {
    messages = [];
  }

  void add(Message msg) {
    messages.add(msg);
    notifyListeners();
  }

  List<Message> get() {
    return List.of(messages);
  }
}
