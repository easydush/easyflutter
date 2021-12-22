import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'screens/feed.dart';
import 'screens/post_create.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InstagramViewState createState() => _InstagramViewState();

  static const routeName = '/homework/4/';
}

class _InstagramViewState extends State<InstagramView> {
  final ScrollController _scrollController = ScrollController();

  int currentPage = 0;
  final _pages = [
    Feed(),
    Feed(),
    PostCreate(),
    Feed(),
    Feed(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child: IconButton(
            onPressed: () => Modular.to.navigate('/'),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.live_tv,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          if (i == 2) {
            Modular.to.navigate('create');
          } else {
            setState(() {
              currentPage = i;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
