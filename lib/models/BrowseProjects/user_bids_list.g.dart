// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bids_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBidsListingToolsRev _$UserBidsListingToolsRevFromJson(
        Map<String, dynamic> json) =>
    UserBidsListingToolsRev(
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
              : ItemUserBidsRev.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserBidsListingToolsRevToJson(
        UserBidsListingToolsRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
