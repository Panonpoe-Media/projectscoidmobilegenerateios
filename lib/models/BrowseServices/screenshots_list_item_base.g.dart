// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemScreenshots _$ItemScreenshotsFromJson(Map<String, dynamic> json) =>
    ItemScreenshots(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['service_images_id'] as String?,
      json['service_id'] as int?,
      json['service_str'] as String?,
      json['service_url'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
      json['description'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemScreenshotsToJson(ItemScreenshots instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'service_images_id': instance.service_images_id,
      'service_id': instance.service_id,
      'service_str': instance.service_str,
      'service_url': instance.service_url,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
      'image_url': instance.image_url,
      'image': instance.image,
      'description': instance.description,
    };
