import 'dart:io';

import '../models/image_item.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  const ImageDetailPage({Key? key, required this.image}) : super(key: key);

  final ImageItem image;

  @override
  State<ImageDetailPage> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Center(
            child: Text(widget.image.name),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
              tag: widget.image.name,
              child: InteractiveViewer(
                
                child: widget.image.isLocal
                    ? Image.file(File(widget.image.url))
                    : Image.network(widget.image.url),
              )),
        )),
      ),
    );
  }
}
