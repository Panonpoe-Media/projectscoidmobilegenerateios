// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelScreenshots _$EditModelScreenshotsFromJson(
        Map<String, dynamic> json) =>
    EditModelScreenshots(
      json['id'] as String?,
      json['product_images_id'] as String?,
      json['product_id'] as int?,
      json['product_str'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..product_url = json['product_url'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$EditModelScreenshotsToJson(
        EditModelScreenshots instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_images_id': instance.product_images_id,
      'product_id': instance.product_id,
      'product_url': instance.product_url,
      'product_str': instance.product_str,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'description': instance.description,
      'image': instance.image,
      'image_url': instance.image_url,
    };

ScreenshotsSuperBase _$ScreenshotsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ScreenshotsSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : EditModelScreenshots.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScreenshotsSuperBaseToJson(
        ScreenshotsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
