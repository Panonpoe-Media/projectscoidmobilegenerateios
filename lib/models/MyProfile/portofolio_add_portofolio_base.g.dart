// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_add_portofolio_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionAddPortofolioPortofolio _$ModelActionAddPortofolioPortofolioFromJson(
        Map<String, dynamic> json) =>
    ModelActionAddPortofolioPortofolio(
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
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAddPortofolioPortofolioToJson(
        ModelActionAddPortofolioPortofolio instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'portofolio_id': instance.portofolio_id,
      'year': instance.year,
      'description': instance.description,
      'link': instance.link,
      'image_url': instance.image_url,
      'image': instance.image,
    };

AddPortofolioPortofolioSuperBase _$AddPortofolioPortofolioSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AddPortofolioPortofolioSuperBase(
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
          : ModelActionAddPortofolioPortofolio.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddPortofolioPortofolioSuperBaseToJson(
        AddPortofolioPortofolioSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
