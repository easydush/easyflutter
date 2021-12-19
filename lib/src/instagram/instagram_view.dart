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
        actions: [],
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {},
      ),
    );
  }
}
