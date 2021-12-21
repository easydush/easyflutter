import 'db/connector.dart';
import 'models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEEEE),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child:IconButton(
            onPressed: () => Modular.to.navigate('/'),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.live_tv,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: DBProvider.db.getAllPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Post item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deletePost(item.id ?? '');
                  },
                  child: ListTile(
                    title: Text(item.text ?? ''),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (value) {
                        DBProvider.db.likeOrUnlikePost(item);
                        setState(() {});
                      },
                      value: item.isLiked,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No posts. Create the one.'));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
                color: Colors.black,
              ),
              label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              color: Colors.black,
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
