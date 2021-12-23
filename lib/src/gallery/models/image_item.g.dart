// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItem _$ImageItemFromJson(Map<String, dynamic> json) => ImageItem(
      name: json['name'] as String,
      url: json['url'] as String,
      isLocal: json['isLocal'] as bool,
    );

Map<String, dynamic> _$ImageItemToJson(ImageItem instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'isLocal': instance.isLocal,
    };
