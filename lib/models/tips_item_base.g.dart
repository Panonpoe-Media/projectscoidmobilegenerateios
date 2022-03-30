// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTips _$ItemTipsFromJson(Map<String, dynamic> json) => ItemTips(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['article_id'] as String?,
      json['title'] as String?,
      json['author_id'] as int?,
      json['author_str'] as String?,
      json['author_url'] as String?,
      (json['author_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['author_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['teaser'] as String?,
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

Map<String, dynamic> _$ItemTipsToJson(ItemTips instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'article_id': instance.article_id,
      'title': instance.title,
      'author_id': instance.author_id,
      'author_str': instance.author_str,
      'author_url': instance.author_url,
      'author_list': instance.author_list,
      'author_list_str': instance.author_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'teaser': instance.teaser,
      'image_url': instance.image_url,
      'image': instance.image,
    };
