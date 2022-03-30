// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyOrders _$ItemMyOrdersFromJson(Map<String, dynamic> json) => ItemMyOrders(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['order_id'] as String?,
      json['track_code'] as String?,
      json['buyer_id'] as int?,
      json['buyer_str'] as String?,
      json['buyer_url'] as String?,
      (json['buyer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['buyer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['payment_method_id'] as int?,
      json['payment_method_str'] as String?,
      (json['payment_method_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['payment_method_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['buyer_payment_id'] as int?,
      json['buyer_payment_str'] as String?,
      json['buyer_payment_url'] as String?,
      (json['buyer_payment_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['buyer_payment_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
      json['coupon'] as String?,
      (json['coupon_value'] as num?)?.toDouble(),
      json['coupon_value_str'] as String?,
      (json['used_balance'] as num?)?.toDouble(),
      json['used_balance_str'] as String?,
      (json['total_sum'] as num?)?.toDouble(),
      json['total_sum_str'] as String?,
      (json['unique_code'] as num?)?.toDouble(),
      json['unique_code_str'] as String?,
      json['notes'] as String?,
      json['cimb_ref'] as int?,
      json['cimb_ref_str'] as String?,
      json['is_test'] as bool?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemMyOrdersToJson(ItemMyOrders instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'order_id': instance.order_id,
      'track_code': instance.track_code,
      'buyer_id': instance.buyer_id,
      'buyer_str': instance.buyer_str,
      'buyer_url': instance.buyer_url,
      'buyer_list': instance.buyer_list,
      'buyer_list_str': instance.buyer_list_str,
      'date': instance.date?.toIso8601String(),
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'payment_method_id': instance.payment_method_id,
      'payment_method_str': instance.payment_method_str,
      'payment_method_list': instance.payment_method_list,
      'payment_method_list_str': instance.payment_method_list_str,
      'buyer_payment_id': instance.buyer_payment_id,
      'buyer_payment_str': instance.buyer_payment_str,
      'buyer_payment_url': instance.buyer_payment_url,
      'buyer_payment_list': instance.buyer_payment_list,
      'buyer_payment_list_str': instance.buyer_payment_list_str,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'coupon': instance.coupon,
      'coupon_value': instance.coupon_value,
      'coupon_value_str': instance.coupon_value_str,
      'used_balance': instance.used_balance,
      'used_balance_str': instance.used_balance_str,
      'total_sum': instance.total_sum,
      'total_sum_str': instance.total_sum_str,
      'unique_code': instance.unique_code,
      'unique_code_str': instance.unique_code_str,
      'notes': instance.notes,
      'cimb_ref': instance.cimb_ref,
      'cimb_ref_str': instance.cimb_ref_str,
      'is_test': instance.is_test,
    };

ItemIndexMyOrders _$ItemIndexMyOrdersFromJson(Map<String, dynamic> json) =>
    ItemIndexMyOrders(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['order_id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['track_code'] as String?,
      json['payment_method_id'] as int?,
      json['payment_method_str'] as String?,
      (json['payment_method_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['payment_method_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
      (json['used_balance'] as num?)?.toDouble(),
      json['used_balance_str'] as String?,
      (json['total_sum'] as num?)?.toDouble(),
      json['total_sum_str'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexMyOrdersToJson(ItemIndexMyOrders instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'order_id': instance.order_id,
      'date': instance.date?.toIso8601String(),
      'track_code': instance.track_code,
      'payment_method_id': instance.payment_method_id,
      'payment_method_str': instance.payment_method_str,
      'payment_method_list': instance.payment_method_list,
      'payment_method_list_str': instance.payment_method_list_str,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'used_balance': instance.used_balance,
      'used_balance_str': instance.used_balance_str,
      'total_sum': instance.total_sum,
      'total_sum_str': instance.total_sum_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
    };
