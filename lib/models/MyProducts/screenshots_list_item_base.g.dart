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
      json['product_images_id'] as String?,
      json['product_id'] as int?,
      json['product_str'] as String?,
      json['product_url'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['description'] as String?,
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
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
      'product_images_id': instance.product_images_id,
      'product_id': instance.product_id,
      'product_str': instance.product_str,
      'product_url': instance.product_url,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'description': instance.description,
      'image_url': instance.image_url,
      'image': instance.image,
    };
