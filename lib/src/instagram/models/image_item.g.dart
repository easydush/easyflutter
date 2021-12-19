// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItem _$ImageItemFromJson(Map<String, dynamic> json) => ImageItem(
      id: json['id'] as String?,
      url: json['url'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$ImageItemToJson(ImageItem instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'postId': instance.postId,
    };
