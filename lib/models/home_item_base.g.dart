// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemHome _$ItemHomeFromJson(Map<String, dynamic> json) => ItemHome(
      json['user_photo'] as String?,
      json['user_name'] as String?,
      json['url'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['message'] as String?,
      json['notification_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemHomeToJson(ItemHome instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'user_photo': instance.user_photo,
      'user_name': instance.user_name,
      'url': instance.url,
      'date': instance.date?.toIso8601String(),
      'message': instance.message,
      'notification_id': instance.notification_id,
    };
