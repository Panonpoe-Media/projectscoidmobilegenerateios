// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookmarks_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyBookmarks _$ItemMyBookmarksFromJson(Map<String, dynamic> json) =>
    ItemMyBookmarks(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bookmark_id'] as String?,
      json['url'] as String?,
      json['logo'] as String?,
      json['title'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemMyBookmarksToJson(ItemMyBookmarks instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'bookmark_id': instance.bookmark_id,
      'url': instance.url,
      'logo': instance.logo,
      'title': instance.title,
    };
