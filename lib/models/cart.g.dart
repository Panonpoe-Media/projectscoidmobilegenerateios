// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelCartRev _$ViewModelCartRevFromJson(Map<String, dynamic> json) =>
    ViewModelCartRev(
      json['id'] as String?,
      (json['available_balance'] as num?)?.toDouble(),
      json['available_balance_str'] as String?,
      (json['total_harga'] as num?)?.toDouble(),
      json['total_harga_str'] as String?,
      json['coupon_code'] as String?,
      json['coupon_value'] as int?,
      json['coupon_value_str'] as String?,
      (json['payable_with_balance'] as num?)?.toDouble(),
      json['payable_with_balance_str'] as String?,
      (json['total_tagihan'] as num?)?.toDouble(),
      json['total_tagihan_str'] as String?,
      json['cart_items'] == null
          ? null
          : CartItemsListingTools.fromJson(
              json['cart_items'] as Map<String, dynamic>),
      json['user_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelCartRevToJson(ViewModelCartRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'available_balance': instance.available_balance,
      'available_balance_str': instance.available_balance_str,
      'total_harga': instance.total_harga,
      'total_harga_str': instance.total_harga_str,
      'coupon_code': instance.coupon_code,
      'coupon_value': instance.coupon_value,
      'coupon_value_str': instance.coupon_value_str,
      'payable_with_balance': instance.payable_with_balance,
      'payable_with_balance_str': instance.payable_with_balance_str,
      'total_tagihan': instance.total_tagihan,
      'total_tagihan_str': instance.total_tagihan_str,
      'cart_items': instance.cart_items,
      'user_id': instance.user_id,
    };

CartViewSuperBaseRev _$CartViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    CartViewSuperBaseRev(
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
          : ViewModelCartRev.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartViewSuperBaseRevToJson(
        CartViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
