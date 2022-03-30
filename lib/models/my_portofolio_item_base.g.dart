// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_portofolio_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyPortofolio _$ItemMyPortofolioFromJson(Map<String, dynamic> json) =>
    ItemMyPortofolio(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['portofolio_id'] as String?,
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
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemMyPortofolioToJson(ItemMyPortofolio instance) =>
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
      'year': instance.year,
      'year_str': instance.year_str,
      'description': instance.description,
      'link': instance.link,
      'image_url': instance.image_url,
      'image': instance.image,
    };
