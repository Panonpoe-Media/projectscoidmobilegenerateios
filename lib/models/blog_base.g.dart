// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBlog _$ModelBlogFromJson(Map<String, dynamic> json) => ModelBlog(
      json['id'] as String?,
      json['article_id'] as String?,
      json['category_id'] as int?,
      json['category_str'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['author_id'] as int?,
      json['author_str'] as String?,
      (json['author_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['author_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
      (json['files'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['files_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..author_url = json['author_url'] as String?
      ..title = json['title'] as String?
      ..published = json['published'] as bool?
      ..published_date = json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String)
      ..teaser = json['teaser'] as String?
      ..content = json['content'] as String?
      ..keywords = json['keywords'] as String?;

Map<String, dynamic> _$ModelBlogToJson(ModelBlog instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'article_id': instance.article_id,
      'category_id': instance.category_id,
      'category_str': instance.category_str,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'author_id': instance.author_id,
      'author_url': instance.author_url,
      'author_str': instance.author_str,
      'author_list': instance.author_list,
      'author_list_str': instance.author_list_str,
      'title': instance.title,
      'published': instance.published,
      'published_date': instance.published_date?.toIso8601String(),
      'teaser': instance.teaser,
      'content': instance.content,
      'keywords': instance.keywords,
      'image': instance.image,
      'image_url': instance.image_url,
      'files_name': instance.files_name,
      'files': instance.files,
    };

BlogSuperBase _$BlogSuperBaseFromJson(Map<String, dynamic> json) =>
    BlogSuperBase(
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
          : ModelBlog.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogSuperBaseToJson(BlogSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelBlog _$ViewModelBlogFromJson(Map<String, dynamic> json) =>
    ViewModelBlog(
      json['id'] as String?,
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
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
      json['content'] as String?,
      (json['files'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['files_url'] as String?,
      json['files_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelBlogToJson(ViewModelBlog instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'author_id': instance.author_id,
      'author_str': instance.author_str,
      'author_url': instance.author_url,
      'author_list': instance.author_list,
      'author_list_str': instance.author_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'image_url': instance.image_url,
      'image': instance.image,
      'content': instance.content,
      'files': instance.files,
      'files_url': instance.files_url,
      'files_name': instance.files_name,
    };

BlogViewSuperBase _$BlogViewSuperBaseFromJson(Map<String, dynamic> json) =>
    BlogViewSuperBase(
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
          : ViewModelBlog.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogViewSuperBaseToJson(BlogViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

BlogListingTools _$BlogListingToolsFromJson(Map<String, dynamic> json) =>
    BlogListingTools(
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
          ?.map((e) =>
              e == null ? null : ItemBlog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogListingToolsToJson(BlogListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
