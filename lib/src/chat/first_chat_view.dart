import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatView> createState() => _ChatViewState();

  static const routeName = '/homework/1/';
}

class _ChatViewState extends State<ChatView> {
  final List<String> _items = [];

  final TextEditingController _textEditingController =
      TextEditingController(text: 'Input your message...');

  void _addToList(String text) {
    setState(() {
      if (text.isNotEmpty) _items.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Center(
          child: BackButton(
            onPressed: () => Modular.to.navigate('/'),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: _items.map((item) {
                    return Card(
                        color: Colors.teal,
                        child: ListTile(
                          title: Text(item),
                        ));
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.arrow_upward),
                    onTap: () {
                      _addToList(_textEditingController.text);
                    },
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
