// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_project_owner_list_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsProjectOwnerListingTools _$AsProjectOwnerListingToolsFromJson(
        Map<String, dynamic> json) =>
    AsProjectOwnerListingTools(
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
              : ItemAsProjectOwnerRev.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AsProjectOwnerListingToolsToJson(
        AsProjectOwnerListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
