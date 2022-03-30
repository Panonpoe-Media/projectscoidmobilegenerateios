// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_pesta_list_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsPestaListingTools _$PointsPestaListingToolsFromJson(
        Map<String, dynamic> json) =>
    PointsPestaListingTools(
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
              : ItemPointsPesta.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointsPestaListingToolsToJson(
        PointsPestaListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
