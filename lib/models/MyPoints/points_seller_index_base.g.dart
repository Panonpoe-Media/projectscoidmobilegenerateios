// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_seller_index_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsSellerIndexTools _$PointsSellerIndexToolsFromJson(
        Map<String, dynamic> json) =>
    PointsSellerIndexTools(
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
              : ItemIndexPointsSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointsSellerIndexToolsToJson(
        PointsSellerIndexTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
