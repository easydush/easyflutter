// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GallerySettingsStore on _GallerySettingsStore, Store {
  final _$gridIconAtom = Atom(name: '_GallerySettingsStore.gridIcon');

  @override
  Icon get gridIcon {
    _$gridIconAtom.reportRead();
    return super.gridIcon;
  }

  @override
  set gridIcon(Icon value) {
    _$gridIconAtom.reportWrite(value, super.gridIcon, () {
      super.gridIcon = value;
    });
  }

  final _$gridSizeAtom = Atom(name: '_GallerySettingsStore.gridSize');

  @override
  int get gridSize {
    _$gridSizeAtom.reportRead();
    return super.gridSize;
  }

  @override
  set gridSize(int value) {
    _$gridSizeAtom.reportWrite(value, super.gridSize, () {
      super.gridSize = value;
    });
  }

  final _$_GallerySettingsStoreActionController =
      ActionController(name: '_GallerySettingsStore');

  @override
  dynamic changeGridSize() {
    final _$actionInfo = _$_GallerySettingsStoreActionController.startAction(
        name: '_GallerySettingsStore.changeGridSize');
    try {
      return super.changeGridSize();
    } finally {
      _$_GallerySettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIcon() {
    final _$actionInfo = _$_GallerySettingsStoreActionController.startAction(
        name: '_GallerySettingsStore.changeIcon');
    try {
      return super.changeIcon();
    } finally {
      _$_GallerySettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gridIcon: ${gridIcon},
gridSize: ${gridSize}
    ''';
  }
}
