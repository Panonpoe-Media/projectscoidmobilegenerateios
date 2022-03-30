// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_items_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexCheckoutItems _$ItemIndexCheckoutItemsFromJson(
        Map<String, dynamic> json) =>
    ItemIndexCheckoutItems(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cart_id'] as String?,
      json['title'] as String?,
      (json['item_price'] as num?)?.toDouble(),
      json['item_price_str'] as String?,
      json['quantity'] as int?,
      json['quantity_str'] as String?,
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexCheckoutItemsToJson(
        ItemIndexCheckoutItems instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'cart_id': instance.cart_id,
      'title': instance.title,
      'item_price': instance.item_price,
      'item_price_str': instance.item_price_str,
      'quantity': instance.quantity,
      'quantity_str': instance.quantity_str,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
    };
