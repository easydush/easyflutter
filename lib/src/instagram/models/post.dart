import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    this.id = 0,
    required this.author,
    this.timestamp,
    this.text,
    this.isLiked = 0,
  });

  int id;
  String author;
  DateTime? timestamp;
  String? text;
  int isLiked;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
