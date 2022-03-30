// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshots_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexScreenshots _$ItemIndexScreenshotsFromJson(
        Map<String, dynamic> json) =>
    ItemIndexScreenshots(
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
      json['description'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexScreenshotsToJson(
        ItemIndexScreenshots instance) =>
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
      'description': instance.description,
    };
