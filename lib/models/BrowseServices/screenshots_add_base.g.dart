// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_add_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddModelScreenshots _$AddModelScreenshotsFromJson(Map<String, dynamic> json) =>
    AddModelScreenshots(
      json['id'] as String?,
      json['service_images_id'] as int?,
      json['service_id'] as int?,
      json['service_str'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
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
      ..service_url = json['service_url'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$AddModelScreenshotsToJson(
        AddModelScreenshots instance) =>
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
      'service_url': instance.service_url,
      'service_str': instance.service_str,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
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
          : AddModelScreenshots.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScreenshotsSuperBaseToJson(
        ScreenshotsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
