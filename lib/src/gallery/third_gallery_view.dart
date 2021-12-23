import 'dart:io';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'stores/gallery_settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'stores/image_store.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GalleryViewState createState() => _GalleryViewState();

  static const routeName = '/homework/3/';
}

class _GalleryViewState extends State<GalleryView> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  GallerySettingsStore settingsStore = Modular.get<GallerySettingsStore>();
  ImageStore imagesStore = Modular.get<ImageStore>();
  final TextEditingController _textEditingController = TextEditingController();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    imagesStore.fetchImages();
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
          actions: [
            GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Observer(builder: (context) {
                    return settingsStore.gridIcon;
                  })),
              onTap: () {
                settingsStore.changeGridSize();
                settingsStore.changeIcon();
              },
            )
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          overlayOpacity: 0.5,
          spacing: 15,
          spaceBetweenChildren: 15,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.camera_alt),
                label: 'Take a photo',
                onTap: () {
                  imagesStore.getFromCamera();
                }),
            SpeedDialChild(
                child: const Icon(Icons.image),
                label: 'Load from gallery',
                onTap: () {
                  imagesStore.getFromGallery();
                }),
            SpeedDialChild(
                child: const Icon(Icons.link),
                label: 'Load from url',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.only(top: 10),
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
                                        hintText: "Insert image url here",
                                        hintStyle:
                                            TextStyle(color: Colors.black54),
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    imagesStore.getFromUrl(
                                        _textEditingController.text);
                                    _textEditingController.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 0,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Observer(
                builder: (context) {
                  return GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: settingsStore.gridSize,
                    children: imagesStore.fetched.map((item) {
                      return GestureDetector(
                        child: Hero(
                          tag: item.name,
                          child: item.isLocal
                              ? Image.file(File(item.url))
                              : Image.network(item.url),
                        ),
                        onTap: () {
                          Modular.to.pushNamed('detail', arguments: item);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
