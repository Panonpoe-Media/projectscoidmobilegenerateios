// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_add_image_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionAddImageScreenshots _$ModelActionAddImageScreenshotsFromJson(
        Map<String, dynamic> json) =>
    ModelActionAddImageScreenshots(
      json['id'] as String?,
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
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAddImageScreenshotsToJson(
        ModelActionAddImageScreenshots instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
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

AddImageScreenshotsSuperBase _$AddImageScreenshotsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AddImageScreenshotsSuperBase(
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
          : ModelActionAddImageScreenshots.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddImageScreenshotsSuperBaseToJson(
        AddImageScreenshotsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
