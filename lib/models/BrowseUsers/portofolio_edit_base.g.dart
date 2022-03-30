// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelPortofolio _$EditModelPortofolioFromJson(Map<String, dynamic> json) =>
    EditModelPortofolio(
      json['id'] as String?,
      json['portofolio_id'] as String?,
      json['year'] as int?,
      json['description'] as String?,
      json['link'] as String?,
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
      ..user_id = json['user_id'] as int?
      ..user_url = json['user_url'] as String?
      ..user_str = json['user_str'] as String?
      ..user_list =
          (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList()
      ..user_list_str = (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList();

Map<String, dynamic> _$EditModelPortofolioToJson(
        EditModelPortofolio instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'portofolio_id': instance.portofolio_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'year': instance.year,
      'description': instance.description,
      'link': instance.link,
      'image': instance.image,
      'image_url': instance.image_url,
    };

PortofolioSuperBase _$PortofolioSuperBaseFromJson(Map<String, dynamic> json) =>
    PortofolioSuperBase(
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
          : EditModelPortofolio.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PortofolioSuperBaseToJson(
        PortofolioSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
