// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_items_index_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutItemsIndexTools _$CheckoutItemsIndexToolsFromJson(
        Map<String, dynamic> json) =>
    CheckoutItemsIndexTools(
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
              : ItemIndexCheckoutItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutItemsIndexToolsToJson(
        CheckoutItemsIndexTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
