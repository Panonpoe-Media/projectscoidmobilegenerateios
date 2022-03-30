// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_decrease_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionDecreaseCartItems _$ModelActionDecreaseCartItemsFromJson(
        Map<String, dynamic> json) =>
    ModelActionDecreaseCartItems(
      json['id'] as String?,
      json['cart_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
      json['product_id'] as int?,
      json['product_str'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_id'] as int?,
      json['project_str'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['service_id'] as int?,
      json['service_str'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bid_id'] as int?,
      json['bid_str'] as String?,
      (json['bid_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bid_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['iklan_id'] as int?,
      json['iklan_str'] as String?,
      (json['iklan_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['iklan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['item_price'] as num?)?.toDouble(),
      json['quantity'] as int?,
      (json['total_price'] as num?)?.toDouble(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionDecreaseCartItemsToJson(
        ModelActionDecreaseCartItems instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'cart_id': instance.cart_id,
      'user_id': instance.user_id,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'title': instance.title,
      'product_id': instance.product_id,
      'product_str': instance.product_str,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'service_id': instance.service_id,
      'service_str': instance.service_str,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
      'bid_id': instance.bid_id,
      'bid_str': instance.bid_str,
      'bid_list': instance.bid_list,
      'bid_list_str': instance.bid_list_str,
      'iklan_id': instance.iklan_id,
      'iklan_str': instance.iklan_str,
      'iklan_list': instance.iklan_list,
      'iklan_list_str': instance.iklan_list_str,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'item_price': instance.item_price,
      'quantity': instance.quantity,
      'total_price': instance.total_price,
    };

DecreaseCartItemsSuperBase _$DecreaseCartItemsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    DecreaseCartItemsSuperBase(
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
          : ModelActionDecreaseCartItems.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DecreaseCartItemsSuperBaseToJson(
        DecreaseCartItemsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
