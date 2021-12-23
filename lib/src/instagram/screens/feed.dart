import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import '../db/connector.dart';
import '../models/image_item.dart';
import '../models/post.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Post> posts = [];
  List<ImageItem> images = [];

  @override
  void initState() {
    super.initState();
    fetchAll();
  }

  void fetchAll() {
    DBProvider.db
        .getAllPosts()
        .then((value) => setState(() => posts = value.reversed.toList()))
        .whenComplete(() => {
              DBProvider.db
                  .getAllImages()
                  .then((value) => setState(() => images = value))
            });
  }

  Widget carousel(List<ImageItem> currentImages) {
    return CarouselSlider(
      options: CarouselOptions(enableInfiniteScroll: false),
      items: currentImages.map((item) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.file(File(item.url))
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const Center(child: Text('No posts. Create the one.'))
        : Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (ctx, i) {
                        return Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/author.jpg'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(posts[i].author),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.more_horiz),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              carousel(images
                                  .where((element) =>
                                      element.postId == posts[i].id)
                                  .toList()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          DBProvider.db
                                              .likeOrUnlikePost(posts[i]);
                                          fetchAll();
                                        },
                                        icon: posts[i].isLiked == 1
                                            ? const Icon(Icons.favorite)
                                            : const Icon(Icons.favorite_border),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.comment),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.send),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.bookmark_border),
                                  ),
                                ],
                              ),

                              if (posts[i].isLiked == 1)
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  child: RichText(
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Liked by ",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: "easydush",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              // caption
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 5,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: posts[i].author + ' ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ), TextSpan(
                                        text: posts[i].text,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // post date
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  DateFormat('dd MMMM yyyy')
                                      .format(
                                          posts[i].timestamp ?? DateTime.now())
                                      .toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
