import 'package:easyflutter/src/chat/first_chat_view.dart';
import 'package:easyflutter/src/api_chat/second_api_chat_view.dart';
import 'package:easyflutter/src/gallery/third_gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/list_item.dart';


class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    this.items = const [
      ListItem(id: 1, url: ChatView.routeName, logoName: '1.png', title: 'Chat'),
      ListItem(id: 2, url: ApiChatView.routeName, logoName: '2.jpg', title: 'API Chat'),
      ListItem(id: 3, url: GalleryView.routeName, logoName: '3.jpg', title: 'Gallery')
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeworks'),
      ),
      body: ListView.builder(
        restorationId: 'homeworkListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.title),
              leading: CircleAvatar(
                foregroundImage: AssetImage('assets/images/${item.logoName}'),
              ),
              onTap: () {
                Modular.to.navigate(item.url);
              });
        },
      ),
    );
  }
}
