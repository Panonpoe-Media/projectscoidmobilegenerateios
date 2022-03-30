// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelPortofolio _$ViewModelPortofolioFromJson(Map<String, dynamic> json) =>
    ViewModelPortofolio(
      json['id'] as String?,
      json['year'] as int?,
      json['year_str'] as String?,
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
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelPortofolioToJson(
        ViewModelPortofolio instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'year': instance.year,
      'year_str': instance.year_str,
      'description': instance.description,
      'link': instance.link,
      'image_url': instance.image_url,
      'image': instance.image,
    };

PortofolioViewSuperBase _$PortofolioViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PortofolioViewSuperBase(
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
          : ViewModelPortofolio.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PortofolioViewSuperBaseToJson(
        PortofolioViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
