// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      author: json['author'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      text: json['text'] as String?,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'timestamp': instance.timestamp?.toIso8601String(),
      'text': instance.text,
      'isLiked': instance.isLiked,
    };
