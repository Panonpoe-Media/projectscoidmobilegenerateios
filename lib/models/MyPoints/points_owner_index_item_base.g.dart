// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_owner_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexPointsOwner _$ItemIndexPointsOwnerFromJson(
        Map<String, dynamic> json) =>
    ItemIndexPointsOwner(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['point_id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['title'] as String?,
      json['amount'] as int?,
      json['amount_str'] as String?,
      json['balance'] as int?,
      json['balance_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexPointsOwnerToJson(
        ItemIndexPointsOwner instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'point_id': instance.point_id,
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'balance': instance.balance,
      'balance_str': instance.balance_str,
    };
