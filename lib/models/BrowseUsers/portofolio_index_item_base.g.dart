// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexPortofolio _$ItemIndexPortofolioFromJson(Map<String, dynamic> json) =>
    ItemIndexPortofolio(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['portofolio_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      json['user_url'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['year'] as int?,
      json['year_str'] as String?,
      json['description'] as String?,
      json['link'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexPortofolioToJson(
        ItemIndexPortofolio instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'portofolio_id': instance.portofolio_id,
      'user_id': instance.user_id,
      'user_str': instance.user_str,
      'user_url': instance.user_url,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'year': instance.year,
      'year_str': instance.year_str,
      'description': instance.description,
      'link': instance.link,
    };
