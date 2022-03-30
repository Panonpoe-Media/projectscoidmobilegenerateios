// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_portofolio_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionAddPortofolioMyPortofolio
    _$ModelActionAddPortofolioMyPortofolioFromJson(Map<String, dynamic> json) =>
        ModelActionAddPortofolioMyPortofolio(
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

Map<String, dynamic> _$ModelActionAddPortofolioMyPortofolioToJson(
        ModelActionAddPortofolioMyPortofolio instance) =>
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

AddPortofolioMyPortofolioSuperBase _$AddPortofolioMyPortofolioSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AddPortofolioMyPortofolioSuperBase(
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
          : ModelActionAddPortofolioMyPortofolio.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddPortofolioMyPortofolioSuperBaseToJson(
        AddPortofolioMyPortofolioSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionEditMyPortofolio _$ModelActionEditMyPortofolioFromJson(
        Map<String, dynamic> json) =>
    ModelActionEditMyPortofolio(
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

Map<String, dynamic> _$ModelActionEditMyPortofolioToJson(
        ModelActionEditMyPortofolio instance) =>
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

EditMyPortofolioSuperBase _$EditMyPortofolioSuperBaseFromJson(
        Map<String, dynamic> json) =>
    EditMyPortofolioSuperBase(
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
          : ModelActionEditMyPortofolio.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditMyPortofolioSuperBaseToJson(
        EditMyPortofolioSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelMyPortofolio _$ModelMyPortofolioFromJson(Map<String, dynamic> json) =>
    ModelMyPortofolio(
      json['id'] as String?,
      json['portofolio_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['year'] as int?,
      json['year_str'] as String?,
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
      ..user_url = json['user_url'] as String?
      ..description = json['description'] as String?
      ..link = json['link'] as String?;

Map<String, dynamic> _$ModelMyPortofolioToJson(ModelMyPortofolio instance) =>
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
      'year_str': instance.year_str,
      'description': instance.description,
      'link': instance.link,
      'image': instance.image,
      'image_url': instance.image_url,
    };

MyPortofolioSuperBase _$MyPortofolioSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyPortofolioSuperBase(
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
          : ModelMyPortofolio.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyPortofolioSuperBaseToJson(
        MyPortofolioSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyPortofolioListingTools _$MyPortofolioListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyPortofolioListingTools(
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
              : ItemMyPortofolio.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyPortofolioListingToolsToJson(
        MyPortofolioListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
