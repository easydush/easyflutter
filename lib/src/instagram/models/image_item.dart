import 'package:json_annotation/json_annotation.dart';

part 'image_item.g.dart';

@JsonSerializable()
class ImageItem {
  ImageItem({
    this.id,
    required this.url,
    required this.postId,
  });

  String? id;
  String url;
  String postId;

  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$ImageItemToJson(this);
}
