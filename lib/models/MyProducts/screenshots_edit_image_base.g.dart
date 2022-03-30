// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_edit_image_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionEditImageScreenshots _$ModelActionEditImageScreenshotsFromJson(
        Map<String, dynamic> json) =>
    ModelActionEditImageScreenshots(
      json['id'] as String?,
      json['product_images_id'] as String?,
      json['product_id'] as int?,
      json['product_str'] as String?,
      json['product_url'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
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
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionEditImageScreenshotsToJson(
        ModelActionEditImageScreenshots instance) =>
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
      'product_str': instance.product_str,
      'product_url': instance.product_url,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'image_url': instance.image_url,
      'image': instance.image,
      'description': instance.description,
    };

EditImageScreenshotsSuperBase _$EditImageScreenshotsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    EditImageScreenshotsSuperBase(
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
          : ModelActionEditImageScreenshots.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditImageScreenshotsSuperBaseToJson(
        EditImageScreenshotsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
