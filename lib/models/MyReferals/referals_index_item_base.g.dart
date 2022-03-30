// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referals_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexReferals _$ItemIndexReferalsFromJson(Map<String, dynamic> json) =>
    ItemIndexReferals(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['user_id'] as String?,
      json['user_name'] as String?,
      json['date_registered'] == null
          ? null
          : DateTime.parse(json['date_registered'] as String),
      json['referer_expires'] == null
          ? null
          : DateTime.parse(json['referer_expires'] as String),
      json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexReferalsToJson(ItemIndexReferals instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'date_registered': instance.date_registered?.toIso8601String(),
      'referer_expires': instance.referer_expires?.toIso8601String(),
      'last_seen': instance.last_seen?.toIso8601String(),
    };
