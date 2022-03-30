// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_pesta_add_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddModelPointsPesta _$AddModelPointsPestaFromJson(Map<String, dynamic> json) =>
    AddModelPointsPesta(
      json['id'] as String?,
      json['point_id'] as int?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['amount'] as int?,
      json['amount_str'] as String?,
      json['balance'] as int?,
      json['balance_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..title = json['title'] as String?;

Map<String, dynamic> _$AddModelPointsPestaToJson(
        AddModelPointsPesta instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'point_id': instance.point_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'balance': instance.balance,
      'balance_str': instance.balance_str,
    };

PointsPestaSuperBase _$PointsPestaSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PointsPestaSuperBase(
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
          : AddModelPointsPesta.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PointsPestaSuperBaseToJson(
        PointsPestaSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
