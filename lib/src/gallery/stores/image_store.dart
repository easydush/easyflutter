import 'package:easyflutter/src/gallery/models/image_item.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

part 'image_store.g.dart';

class ImageStore = _ImageStore with _$ImageStore;

abstract class _ImageStore with Store {
  @observable
  ObservableList<ImageItem>? images = ObservableList.of([]);

  @action
  void fetchImages() {
    for (var i = 0; i < 10; i++) {
      ImageItem imageFromUrl = ImageItem(
          name: i.toString(),
          url: 'https://picsum.photos/${i}00',
          isLocal: false);
      images?.add(imageFromUrl);
      images = ObservableList.of(images!);
    }
  }

  @action
  void addImage(ImageItem image) {
    images?.add(image);
    images = ObservableList.of(images!);
  }

  @computed
  ObservableList<ImageItem> get fetched =>
      ObservableList.of(images?.reversed.toList() ?? []);

  void getLocalImage(bool isFromCamera) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: isFromCamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      addImage(ImageItem(
          name: basename(pickedFile.path),
          url: pickedFile.path,
          isLocal: true));
    }
  }

  void getFromGallery() async {
    return getLocalImage(false);
  }

  void getFromCamera() async {
    return getLocalImage(true);
  }

  void getFromUrl(String url) async {
    addImage(ImageItem(name: url, url: url, isLocal: false));
  }
}
