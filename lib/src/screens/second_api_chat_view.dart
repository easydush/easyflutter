import 'dart:async';

import 'package:easyflutter/src/store/message_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ApiChatView extends StatefulObserverWidget {
  const ApiChatView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ApiChatView> createState() => _ChatViewState();

  static const routeName = '/homework/2';
}

class _ChatViewState extends State<ApiChatView> {
  final MessageStore _messageStore = MessageStore();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _textEditingController =
      TextEditingController(text: 'Type your message...');
  final ScrollController _scrollController = ScrollController();

  void _addToList(String text) {
    setState(() {
      if (text.isNotEmpty) _messageStore.addMessage(text);
    });
    _textEditingController.clear();
  }

  @override
  void initState() {
    super.initState();
    _messageStore.fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Scrollbar(
              controller: _scrollController,
              interactive: true,
              thickness: 10,
              child: ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: _messageStore.fetched.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 60),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (_messageStore.fetched[index].mine ?? false
                          ? Alignment.topRight
                          : Alignment.topLeft),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (_messageStore.fetched[index].mine ?? false
                              ? Colors.teal[200]
                              : Colors.grey.shade200),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _messageStore.fetched[index].author,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                _messageStore.fetched[index].message,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _addToList(_textEditingController.text);
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
