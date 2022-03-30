// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookmarks_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelMyBookmarks _$ModelMyBookmarksFromJson(Map<String, dynamic> json) =>
    ModelMyBookmarks(
      json['id'] as String?,
      json['bookmark_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..title = json['title'] as String?
      ..url = json['url'] as String?
      ..md5 = json['md5'] as String?
      ..logo = json['logo'] as String?
      ..date_added = json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String);

Map<String, dynamic> _$ModelMyBookmarksToJson(ModelMyBookmarks instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'bookmark_id': instance.bookmark_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'title': instance.title,
      'url': instance.url,
      'md5': instance.md5,
      'logo': instance.logo,
      'date_added': instance.date_added?.toIso8601String(),
    };

MyBookmarksSuperBase _$MyBookmarksSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyBookmarksSuperBase(
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
          : ModelMyBookmarks.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyBookmarksSuperBaseToJson(
        MyBookmarksSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyBookmarksListingTools _$MyBookmarksListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyBookmarksListingTools(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ItemMyBookmarks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyBookmarksListingToolsToJson(
        MyBookmarksListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
