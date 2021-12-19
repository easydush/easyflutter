import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    this.id,
    required this.author,
    this.timestamp,
    this.text,
    this.isLiked = false,
  });

  String? id;
  String author;
  DateTime? timestamp;
  String? text;
  bool isLiked;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
