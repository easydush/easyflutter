// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImageStore on _ImageStore, Store {
  Computed<ObservableList<ImageItem>>? _$fetchedComputed;

  @override
  ObservableList<ImageItem> get fetched => (_$fetchedComputed ??=
          Computed<ObservableList<ImageItem>>(() => super.fetched,
              name: '_ImageStore.fetched'))
      .value;

  final _$imagesAtom = Atom(name: '_ImageStore.images');

  @override
  ObservableList<ImageItem>? get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<ImageItem>? value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$_ImageStoreActionController = ActionController(name: '_ImageStore');

  @override
  void fetchImages() {
    final _$actionInfo = _$_ImageStoreActionController.startAction(
        name: '_ImageStore.fetchImages');
    try {
      return super.fetchImages();
    } finally {
      _$_ImageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addImage(ImageItem image) {
    final _$actionInfo =
        _$_ImageStoreActionController.startAction(name: '_ImageStore.addImage');
    try {
      return super.addImage(image);
    } finally {
      _$_ImageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images},
fetched: ${fetched}
    ''';
  }
}
