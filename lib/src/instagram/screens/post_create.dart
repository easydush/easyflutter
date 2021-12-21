import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyflutter/src/instagram/db/connector.dart';
import 'package:easyflutter/src/instagram/models/image_item.dart';
import 'package:easyflutter/src/instagram/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:core';
import 'package:cross_file/cross_file.dart';

import 'package:uuid/uuid.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({Key? key}) : super(key: key);

  @override
  _PostCreate createState() => _PostCreate();
}

class _PostCreate extends State<PostCreate> {
  File? file;
  String id = const Uuid().v1();
  TextEditingController descriptionController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  List<XFile> currentImages = [];

  @override
  initState() {
    super.initState();
  }

  void getLocalImages(bool isFromCamera) async {
    List<XFile>? images = await imagePicker.pickMultiImage();

    setState(() {
      images?.forEach((elem) => currentImages.add(elem));
    });
  }

  void uploadImagesFromCamera() async {
    return getLocalImages(true);
  }

  void uploadImagesFromGallery() async {
    return getLocalImages(false);
  }

  void savePost() async {
    DBProvider.db.newPost(
        Post(author: 'easydush', text: descriptionController.text))
        .then((value) => {
          print(value);
          currentImages?.forEach((image) =>
          DBProvider.db.newImage(ImageItem(postId: value, url: image.path))
    )
    });
    Modular.to.navigate('/homework/4/');
  }

  Widget carousel() {
    return CarouselSlider(
      options: CarouselOptions(enableInfiniteScroll: false),
      items: currentImages.map((item) {
        return GestureDetector(
          child: Hero(tag: item.name, child: Image.file(File(item.path))),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentImages.isEmpty) uploadImagesFromGallery();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.black),
          //     onPressed: clearImage),
          title: const Text(
            'Creating post',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => {savePost()},
                child: const Text(
                  "Post",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            PostForm(
              descriptionController: descriptionController,
            ),
            carousel(),
          ],
        ));
  }
}

class PostForm extends StatelessWidget {
  final TextEditingController descriptionController;

  PostForm({required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 0.0)),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/author.jpg'),
            ),
            SizedBox(
              width: 280.0,
              child: TextField(
                maxLines: 5,
                controller: descriptionController,
                decoration:
                const InputDecoration(hintText: "Write a caption..."),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
