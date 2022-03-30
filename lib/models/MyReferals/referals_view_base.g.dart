// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referals_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelReferals _$ViewModelReferalsFromJson(Map<String, dynamic> json) =>
    ViewModelReferals(
      json['id'] as String?,
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
      json['current_projects'] as int?,
      json['current_projects_str'] as String?,
      json['projects_won'] as int?,
      json['projects_won_str'] as String?,
      json['projects_owned'] as int?,
      json['projects_owned_str'] as String?,
      json['product_sold'] as int?,
      json['product_sold_str'] as String?,
      json['product_bought'] as int?,
      json['product_bought_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelReferalsToJson(ViewModelReferals instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'user_name': instance.user_name,
      'date_registered': instance.date_registered?.toIso8601String(),
      'referer_expires': instance.referer_expires?.toIso8601String(),
      'last_seen': instance.last_seen?.toIso8601String(),
      'current_projects': instance.current_projects,
      'current_projects_str': instance.current_projects_str,
      'projects_won': instance.projects_won,
      'projects_won_str': instance.projects_won_str,
      'projects_owned': instance.projects_owned,
      'projects_owned_str': instance.projects_owned_str,
      'product_sold': instance.product_sold,
      'product_sold_str': instance.product_sold_str,
      'product_bought': instance.product_bought,
      'product_bought_str': instance.product_bought_str,
    };

ReferalsViewSuperBase _$ReferalsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ReferalsViewSuperBase(
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
          : ViewModelReferals.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReferalsViewSuperBaseToJson(
        ReferalsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
