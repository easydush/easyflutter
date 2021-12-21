import 'package:easyflutter/src/instagram/models/image_item.dart';

import '../models/post.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  initDB() async {
    String path = "instagram.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db
          .execute("CREATE TABLE post ("
              "id INTEGER PRIMARY KEY NOT NULL,"
              "author TEXT,"
              "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,"
              "text TEXT,"
              "is_liked BOOLEAN"
              ")")
          .whenComplete(() => db.execute("CREATE TABLE image_item ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "url TEXT,"
              "post_id INTEGER,"
              "FOREIGN KEY (post_id) REFERENCES post(id)"
              ")"));
    });
  }

  Future<int> newPost(Post newPost) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT INTO post (id, author, text, is_liked)"
        " VALUES (?, ?, ?, ?)",
        [newPost.id, newPost.author, newPost.text, newPost.isLiked]);
    return raw;
  }

  newImage(ImageItem newPost) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT INTO image_item (post_id,url)"
        " VALUES (?,?)",
        [newPost.postId, newPost.url]);
    return raw;
  }

  getPost(String id) async {
    final db = await database;
    var res = await db.query("post", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Post.fromJson(res.first) : null;
  }

  likeOrUnlikePost(Post post) async {
    final db = await database;
    Post liked = Post(
        id: post.id,
        author: post.author,
        text: post.text,
        timestamp: post.timestamp,
        isLiked: !post.isLiked);
    var res = await db
        .update("post", liked.toJson(), where: "id = ?", whereArgs: [liked.id]);
    return res;
  }

  Future<List<Post>> getAllPosts() async {
    final db = await database;
    var res = await db.query(
        "post");
    List<Post> list =
        res.isNotEmpty ? res.map((c) => Post.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<ImageItem>> getAllImages() async {
    final db = await database;
    var res = await db.query(
        "image_item");
    List<ImageItem> list =
    res.isNotEmpty ? res.map((c) => ImageItem.fromJson(c)).toList() : [];
    return list;
  }

  deletePost(String id) async {
    final db = await database;
    return db.delete("post", where: "id = ?", whereArgs: [id]);
  }
}
